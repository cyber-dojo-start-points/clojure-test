# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh
function cyber_dojo_exit()
{
  # 2. Remove text dirs/files we don't want returned.
  # The test run creates no files of its own, so there is nothing to remove.
  # Name dirs or files in the calls below when yours does.
  #cyber_dojo_delete_dirs target
  #cyber_dojo_delete_files ...
  true
}
trap cyber_dojo_exit EXIT SIGTERM
# --------------------------------------------------------------

# The tests run on a JVM started here rather than through lein. lein's only job
# in a kata would be to work out the classpath, and the image worked that out
# when it was built and wrote it to /.classpath; starting lein to ask for it
# again costs several times what the test run itself costs.
#
# The JVM replays a class-data archive the image dumped at build time, which is
# most of what it would otherwise spend its time doing: a fresh container loads
# clojure's several thousand classes from the jars again. Nothing is lost when
# that archive is missing or unusable; the run is only slower.
JVM_OPTS=()
JVM_OPTS+=(-XX:+TieredCompilation)               # tiered JIT, so a tier can be named
JVM_OPTS+=(-XX:TieredStopAtLevel=1)              # a run is milliseconds; later tiers never repay
JVM_OPTS+=(-XX:SharedArchiveFile=/.clojure.jsa)  # replay the archive the image dumped
JVM_OPTS+=('-Xlog:cds*=off')                     # an unusable archive says so, on stdout
readonly JVM_OPTS

# Tests are run wherever they are written, in subdirectories as well as beside
# this file, so the glob is recursive. A test file is loaded by its path, so it
# may declare whatever namespace it likes. A source file is found by namespace
# instead, the kata's own directory being the root of the classpath, so
# roman/numerals.clj declares roman.numerals; one whose namespace does not match
# its path is reported as a file that could not be located.
shopt -s globstar

# The kata's own directory goes last on the classpath. That is where this run's
# source and test files are, and a JVM replaying an archive needs a classpath
# beginning with the one the archive was dumped from, which held jars only.
#
# A learner adds tests by adding files; every file the glob matches is run.
java "${JVM_OPTS[@]}" -cp "$(cat /.classpath):." \
  clojure.main /run_test_files.clj **/*_test.clj

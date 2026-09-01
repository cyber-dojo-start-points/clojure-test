# ------------------------------------------------------------------------
# cyber-dojo returns text files under /sandbox that are
# created/deleted/changed. In tidy_up you can remove any
# such files you don't want returned to the browser.

trap tidy_up EXIT

function tidy_up()
{
  # The test run creates no files of its own, so there is nothing to remove.
  # Name dirs or files here, using the calls below, when yours does.
  #delete_dirs target
  true
}

function delete_dirs()
{
  for dirname in "$@"
  do
      rm -rf "${dirname}" 2> /dev/null || true
  done
}

function delete_files()
{
  for filename in "$@"
  do
      rm "${filename}" 2> /dev/null || true
  done
}

# ------------------------------------------------------------------------

# The tests run on a JVM started here rather than through lein. lein's only job
# in a kata would be to work out the classpath, and the image worked that out
# when it was built and wrote it to /.classpath; starting lein to ask for it
# again costs several times what the test run itself costs.
#
# The kata's own directory comes after those jars. That is where this run's
# source and test files are, and a JVM replaying an archive needs a classpath
# beginning with the one the archive was dumped from, which held jars only.
#
# The JVM replays a class-data archive the image dumped at build time, which is
# most of what it would otherwise spend its time doing: a fresh container loads
# clojure's several thousand classes from the jars again. cds logging is off
# because a JVM that cannot use an archive says so on stdout, and that belongs
# in a build log rather than in front of whoever is doing the kata. Nothing is
# lost when an archive cannot be used; the run is only slower.
readonly JVM_OPTS='-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:SharedArchiveFile=/.clojure.jsa -Xlog:cds*=off'

# Every file matching the glob is run, so a learner adds tests by adding files.
java ${JVM_OPTS} -cp "$(cat /.classpath):." clojure.main /run_test_files.clj *_test.clj

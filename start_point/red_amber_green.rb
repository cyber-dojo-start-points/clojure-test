
lambda { |stdout,stderr,status|
  output = stdout + stderr
  syntax_error_pattern = /Exception in thread/
  ran_pattern = /Ran (\d+) tests containing (\d+) assertions.(\s*)(\d+) failures, (\d+) errors./
  return :amber if syntax_error_pattern.match(output)
  return :red   if output.scan(ran_pattern).any? { |res| res[3] != '0' || res[4] != '0' }
  # The count of tests run is what keeps a kata holding none out of green.
  # clojure.test prints the same zero failures and zero errors either way, so
  # without it a run that proved nothing reads as a pass.
  return :green if output.scan(ran_pattern).any? { |res| res[3] == '0' && res[4] == '0' && res[0] != '0' }
  return :amber
}

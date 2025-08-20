default: lint

ci_opt := if env("PRE_COMMIT_HOME", "") != "" { "-ci" } else { "" }

precommit:
    just lint{{ci_opt}}

prepush:
    just test{{ci_opt}}

lint:
   echo "running lints: LOCAL"

lint-ci:
   echo "running lints: CI"
   exit 1 # Make CI fail

test:
   echo "running push tests: LOCAL"

test-ci:
   echo "running push tests: CI"
   exit 1 # Make CI fail

default: lint

lint:
   echo "running lints: LOCAL"

lint-ci:
   echo "running lints: CI"

test:
   echo "running push tests: LOCAL"

test-ci:
   echo "running push tests: CI"

# Auto-detect CI vs local based on PRE_COMMIT_HOME
precommit:
   #!/usr/bin/env bash
   if [ -n "$PRE_COMMIT_HOME" ]; then
       just lint-ci
   else
       just lint
   fi

prepush:
   #!/usr/bin/env bash
   if [ -n "$PRE_COMMIT_HOME" ]; then
       just test-ci
   else
       just test
   fi

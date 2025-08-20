default: lint

lint:
   echo "running lints: LOCAL"

lint-ci:
   echo "running lints: CI"

test:
   echo "running push tests: LOCAL"

test-ci:
   echo "running push tests: CI"

# Readable output of env vars beginning with `PRE`
debug-env:
   env | grep '^PRE' | cut -d'=' -f1 | sort | xargs echo | tr ' ' ','

# Readable output of env vars beginning with `PRE` and their values
debug-env-values:
   env | grep '^PRE' | sort | while IFS='=' read -r key value; do echo "$key: $value"; done

precommit:    lint
precommit-ci: lint-ci debug-env

prepush:      test
prepush-ci:   test-ci debug-env

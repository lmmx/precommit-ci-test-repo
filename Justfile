default: lint

lint:
   echo "running lints: LOCAL"

lint-ci:
   echo "running lints: CI"
   just debug-env
   exit 1 # fail on purpose to show env vars on CI

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
precommit-ci: lint-ci

prepush:      test
prepush-ci:   test-ci debug-env

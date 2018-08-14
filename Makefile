#!/usr/bin/env make

.PHONY: all test lint

all:
	@bash -c 'if [ "$(uname -s)" == "Linux" ]; then make lint; fi'
	@make test

test:
	@bash run_tests.sh

lint: /tmp/shellcheck-latest/shellcheck
	@$< discord.sh
	@$< run_tests.sh

/tmp/shellcheck-latest/shellcheck:
	@wget -c 'https://goo.gl/ZzKHFv' -O - | tar -xvJ -C /tmp/ >/dev/null 2>&1
	@chmod +x $@


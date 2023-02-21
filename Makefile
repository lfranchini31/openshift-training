#-------------------------
# Target: doc
#-------------------------
.PHONY: doc doc.html clean

## Generate the documentation from asciidoc
doc: doc.html doc.pdf

doc.pdf: clean
	@echo "==> generating openShift lab: pdf"
	@docker run --rm -u $$(id -u $${USER}):$$(id -g $${USER}) \
		-v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf \
		-a source-highlighter=pygments \
		-a pygments-style=manni \
		-D /documents -r asciidoctor-diagram lab/readme.adoc

# Remove previous documentation
clean:
	rm -f readme*.*

#-------------------------
# Target: help
#-------------------------

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

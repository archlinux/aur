
YAML_FILES := $(wildcard ./*.yml)
YAML_REPORT := ./lint-yaml.txt

.PHONY: lint-yaml
lint-yaml: $(YAML_REPORT)
$(YAML_REPORT): $(YAML_FILES)
	docker run --rm -v "${PWD}:/workdir" giantswarm/yamllint $?
	touch $(YAML_REPORT)

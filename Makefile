SHELL := /bin/bash
.PHONY: test

test:
	jq -e -s '.[0]==.[1]' <(./jskos-metrics concepts examples/concepts.ndjson) examples/concept-expect.json
	jq -e -s '.[0]==.[1]' <(./jskos-metrics mappings examples/mappings.ndjson) examples/mapping-expect.json

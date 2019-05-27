SHELL := /bin/bash
.PHONY: test

test:
	jq -e -s '.[0]==.[1]' <(./concepts/concept-metrics.sh examples/concepts.ndjson) examples/concept-expect.json
	jq -e -s '.[0]==.[1]' <(./mappings/mapping-metrics.sh examples/mappings.ndjson) examples/mapping-expect.json

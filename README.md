# jskos-metrics

[![Build Status](https://travis-ci.org/gbv/jskos-metrics.svg?branch=main)](https://travis-ci.org/gbv/jskos-metrics)
[![CC-0 license](https://img.shields.io/badge/License-CC--0-blue.svg)](https://creativecommons.org/licenses/by-nd/4.0)

> Scripts to create statistical analysis of JSKOS data

## Installation

You need to clone the repository or copy its content to a local directory.

The scripts require [jq](https://stedolan.github.io/jq/) and standard Unix command line tools (bash, sort, uniq, perl...).

To call the main script `jskos-metrics` from anywhere, add a symlink from a directory in your PATH, e.g.:

~~~sh
cd ~/.local/bin/
ln -s $DIRECTORY_OF_JSKOS_METRICS/jskos-metrics jskos-metrics
~~~

## Usage

Run script `./jskos-metrics` with a item type (`concepts` or `mappings`) and a `.ndjson` file. On success the statistics are emitted in JSON format:

Metrics of concepts contain the following keys:

* `keys` - histogram of JSKOS field names
* `conceptNumber` - total number of concepts
* `broaderDistribution` - histogram of number of broader terms
* `narrowerDistribution` - histogramm of number of narrower terms
* `narrowerDistributionImplicit` - histogramm of number of narrower terms, references broaderDistribution for Values
* `topConceptOf` - number the top concepts
* `typeDistribution` - histogram of concept type URIs
* `levelDistribution` - histogram of concepts per hierarchy level

Metrics of mappings contains the following keys:

* `keys` - histogram of JSKOS field names
* `fromSchemeDistribution` - histogram of source scheme URIs
* `toSchemeDistribution` - histogram of target scheme URIs
* `typeDistribution` - histogram mapping type URIs
* `creatorNames` - histogram of creator names
* `creatorNumber` - histogram of number of creators per mapping
* `createdPerDay` - number of mappings created per day
* `modifiedPerDay` - number of mappings modified per day
* `fromNumber` - histogram of number of source concepts
* `toNumber` -  histogram of number of target concepts
* `fromConceptsCount` - number of distinct source concepts
* `toConceptsCount` - number of distinct target concepts
* `mappingURICount` - number of mapping uris

## Implementation

Each metric id calculated with a script of its own. Each item type has a main script that executes its scripts and emits a JSON file:

* `concepts/concept-metrics.sh` - concept scheme metrics, main script
* `mappings/mapping-metrics.sh` - mapping metrics, main script

Run `make` to execute `jskos-metrics` with examples as unit test.

## Examples

Directory `examples` contains sample files which are also used for testing.

~~~sh
./jskos-metrics concepts examples/concepts.ndjson
./jskos-metrics mappings examples/mappings.ndjson
~~~

## Related work

KOS metrics have best been summarized by Stock (2015).

* Wolfgang G. Stock: (2015) *Informetric Analyses of Knowledge Organization Systems (KOSs)*. <https://arxiv.org/abs/1505.03671> (published in: C. R. Sugimoto (Ed.): *Theories of Informetrics and Scholarly Communication*. De Gruyter, 2015)

* Gangemi, Catenacci, Ciaramita, & Lehmann (2005): *A theoretical framework for ontology evaluation and validation*. ([PDF available](http://www.loa.istc.cnr.it/old/Papers/swap_final_v2.pdf))

* Owens (2004): *Thesaurus evaluation*

Consistency checks of KOS have been implemented by

* [Skosify](http://demo.seco.tkk.fi/skosify/skosify)

---

*Some more background information can be found [in the internal GBV wiki](https://info.gbv.de/pages/viewpage.action?spaceKey=COLIBRI&title=KOS-Statistik). We are going to also make public this drafts.*

## License

This scripts can be used without any restrictions (CC Zero).


# jskos-metrics

> Scripts to create statistical analysis of JSKOS data

## Dependencies

* [jq](https://stedolan.github.io/jq/)
* Standard Linux command line tools (bash, sort, uniq, system perl...)

## Usage

Each metrics can be calculated with a script of its own. Each subdirectory has a main script that executes its scripts and emits a JSON file.

* `concepts/concept-metrics.sh` - concept scheme metrics, main script

* `mappings/mapping-metrics.sh` - mapping metrics, main script

Directory `examples` contains sample JSKOS data and expected metric results to test the metric scripts. Call `make` to run the tests.

### JSON format

The concept-metrics file contains the following keys:

* `conceptNumber` - total number of concepts
* `broaderDistribution` - histogram of number of broader terms
* `narrowerDistribution` - histogramm of number of narrower terms
* `narrowerDistributionImplicit` - histogramm of number of narrower terms, references broaderDistribution for Values
* `topConceptOf` - number the top concepts
* `typeDistribution` - histogram of concept type URIs
* `levelDistribution` - histogram of concepts per hierarchy level

The mapping-metrics file contains the following keys:

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

### Examples

Directory `examples` contains sample files which are also used for testing.

~~~
./concepts/concept-metrics.sh examples/concept-expect.json | jq

./mappings/mapping-metrics.sh examples/mapping-expect.json
~~~

In this case jq is only needed for pretty-printing.

## Related work

KOS metrics have best been summarized by Stock (2015).

* Wolfgang G. Stock: (2015) *Informetric Analyses of Knowledge Organization Systems (KOSs)*. <https://arxiv.org/abs/1505.03671> (published in: C. R. Sugimoto (Ed.): *Theories of Informetrics and Scholarly Communication*. De Gruyter, 2015)

* Gangemi, Catenacci, Ciaramita, & Lehmann (2005): *A theoretical framework for ontology evaluation and validation*. ([PDF available](http://www.loa.istc.cnr.it/old/Papers/swap_final_v2.pdf))

* Owens (2004): *Thesaurus evaluation*

Consistency checks of KOS have been implemented by

* [Skosify](http://demo.seco.tkk.fi/skosify/skosify)

---

*Some more background information can be found [in the internal GBV wiki](https://info.gbv.de/pages/viewpage.action?spaceKey=COLIBRI&title=KOS-Statistik). We are going to also make public this drafts.*

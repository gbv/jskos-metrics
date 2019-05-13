# jskos-metrics

> Scripts to create statistical analysis of JSKOS data

## Dependencies

* [jq](https://stedolan.github.io/jq/)
* Standard Linux command line tools (bash, sort, uniq, system perl...)

## Usage

Each metrics can be calculated with a script of its own. Each subdirectory has a main script that executes its scripts and emits a JSON file.

* `scheme/scheme-metrics.sh` - concept scheme metrics, main script

* `mappings/mapping-metrics.sh` - mapping metrics, main script

### JSON format

The scheme-metrics file contains the following keys:

* `conceptNumber` - the number of concepts in a classification
* `broaderDistribution` - histogramm of number of broader Terms
* `narrowerDistribution` - histogramm of number of narrower terms
* `narrowerDistributionImplicit` - histogramm of number of narrower terms, references broaderDistribution for Values
* `topConceptOf` - the number the top concepts, hierarchy 0, of a classification
* `typeDistribution` - lists the occurences of types, here: URIs
* `levelDistribution` - number of concepts per hierarchy level

The mapping-metrics file contains the following keys:
* `keys` - the number of every unique key
* `fromSchemeDistribution` - histogramm of unique URIs from the scheme's origin
* `toSchemeDistribution` - histogramm of unique URIs from the scheme's target
* `typeDistribution` - number of unique types
* `creatorNames` - number of unique creator names
* `creatorNumber` - histogramm of contents of the "creator" field
* `createdPerDay` - number of mappings created per day
* `modifiedPerDay` - number of mappings modified per day
* `fromNumber` - number of contents of the "from" field
* `toNumber` - number of contents of the "to" field
* `fromConceptsCount` - number of from concepts
* `toConceptsCount` - number of to concepts
* `mappingURICount` - number of all URIs


### Examples

~~~
./scheme/scheme-metrics.sh concepts.ndjson | jq

./mappings/mapping-metrics.sh mapping.ndjson
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

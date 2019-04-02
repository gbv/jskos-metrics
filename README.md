# jskos-metrics

> Scripts to create statistical analysis of JSKOS data

## Dependencies

* [jq](https://stedolan.github.io/jq/)

## Usage

Each metrics can be calculated with a script of its own. Main script
`jskos-concept-metrics.sh` runs all metrics for a set of concepts of one
concept scheme. Example:

~~~
./jskos-concept-metrics.sh concepts.ndjson | jq
~~~

jq is needed for pretty-printing

## Related work

KOS metrics have best been summarized by Stock (2015).

* Wolfgang G. Stock: (2015) *Informetric Analyses of Knowledge Organization Systems (KOSs)*. <https://arxiv.org/abs/1505.03671> (published in: C. R. Sugimoto (Ed.): *Theories of Informetrics and Scholarly Communication*. De Gruyter, 2015)

* Gangemi, Catenacci, Ciaramita, & Lehmann (2005): *A theoretical framework for ontology evaluation and validation*. ([PDF available](http://www.loa.istc.cnr.it/old/Papers/swap_final_v2.pdf))

* Owens (2004): *Thesaurus evaluation*

Consistency checks of KOS have been implemented by

* [Skosify](Thesaurus evaluation)
* ...

*Some more background information can be found [in the internal GBV wiki](https://info.gbv.de/pages/viewpage.action?spaceKey=COLIBRI&title=KOS-Statistik).*

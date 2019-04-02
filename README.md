# jskos-metrics

> Scripts to create statistical analysis of JSKOS data

## Dependencies

* [jq](https://stedolan.github.io/jq/)
* Standard Linux command line tools (bash, sort, uniq, system perl...)

## Usage

Each metrics can be calculated with a script of its own. Each subdirectory has a main script that executes its scripts and emits a JSON file.

* `scheme/scheme-metrics.sh` - concept scheme metrics

## Example

~~~
./scheme/scheme-metrics.sh concepts.ndjson | jq
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

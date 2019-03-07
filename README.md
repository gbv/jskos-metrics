# jskos-metrics

> Scripts to create statistical analysis of JSKOS data

## Dependencies

* [jq](https://stedolan.github.io/jq/)

## Usage

Each metrics can be calculated with a script of its own. Main script
`jskos-concept-metrics.sh` runs all metrics for a set of concepts of one
concept scheme. Example:

~~~
./jskos-concept-metrics.sh concepts.ndjson
~~~

## See also

Some background information can be found [in the internal GBV wiki](https://info.gbv.de/pages/viewpage.action?spaceKey=COLIBRI&title=KOS-Statistik).

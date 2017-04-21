#!/bin/bash -euo

"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-python 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-groovy 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-java 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-clojure 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-r 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-scala 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-beanshell 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-ruby 2> /dev/null
"${PREFIX}/bin/jupyter" kernelspec remove -fy scijava-javascript 2> /dev/null

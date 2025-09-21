#!/bin/bash

export JAVA_HOME=$(archlinux-java-run --min 21 --max 24 -j)
export PATH=$JAVA_HOME/bin:$PATH

/usr/share/portfolio/PortfolioPerformance "$@"

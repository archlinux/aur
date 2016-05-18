# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-rbundle
pkgver=2016.05.18
pkgrel=1
pkgdesc="A bundle of R packages needed by JASP desktop"
url="http://cran.r-project.org/"
arch=('any')
depends=('r')
makedepends=('r' 'gcc-fortran')
source=("rbundle.R")

pkgver() {
	echo $(date +%Y.%m.%d)
}
provides=('r-cran-abind' 'r-cran-htmltools' 'r-cran-jsonlite' 'r-cran-yaml' 'r-cran-xtable' 'r-cran-iterators' 'r-cran-arm' 'r-cran-htmlwidgets' 'r-cran-rstudioapi' 'r-cran-rcolorbrewer' 'r-cran-dichromat' 'r-cran-labeling' 'r-cran-pkgmaker' 'r-cran-registry' 'r-cran-rngtools' 'r-cran-gridbase' 'r-cran-foreach' 'r-cran-doparallel' 'r-cran-stringi' 'r-cran-magrittr' 'r-cran-modeltools' 'r-cran-sparsem' 'r-cran-matrixcalc' 'r-cran-mi' 'r-cran-diagrammer' 'r-cran-formula' 'r-cran-proto' 'r-cran-scales' 'r-cran-latticeextra' 'r-cran-acepack' 'r-cran-gtable' 'r-cran-gridextra' 'r-cran-nmf' 'r-cran-irlba' 'r-cran-digest' 'r-cran-rjson' 'r-cran-whisker' 'r-cran-th.data' 'r-cran-sandwich' 'r-cran-zoo' 'r-cran-coda' 'r-cran-pbapply' 'r-cran-mvtnorm' 'r-cran-stringr' 'r-cran-gtools' 'r-cran-matrixmodels' 'r-cran-rcppeigen' 'r-cran-minqa' 'r-cran-nloptr' 'r-cran-reshape2' 'r-cran-coin' 'r-cran-pbkrtest' 'r-cran-quantreg' 'r-cran-colorspace' 'r-cran-psych' 'r-cran-ellipse' 'r-cran-sem' 'r-cran-plyr' 'r-cran-hmisc' 'r-cran-igraph' 'r-cran-jpeg' 'r-cran-png' 'r-cran-sna' 'r-cran-corpcor' 'r-cran-ggplot2' 'r-cran-glasso' 'r-cran-huge' 'r-cran-fdrtool' 'r-cran-d3network' 'r-cran-ggm' 'r-cran-elliptic' 'r-cran-contfrac' 'r-cran-desolve' 'r-cran-mnormt' 'r-cran-pbivnorm' 'r-cran-quadprog' 'r-cran-estimability' 'r-cran-multcomp' 'r-cran-lmtest' 'r-cran-qvcalc' 'r-cran-relimp' 'r-cran-bayesfactor' 'r-cran-lme4' 'r-cran-rcpp' 'r-cran-rinside' 'r-cran-afex' 'r-cran-base64' 'r-cran-car' 'r-cran-effects' 'r-cran-qgraph' 'r-cran-hypergeo' 'r-cran-lavaan' 'r-cran-logspline' 'r-cran-lsmeans' 'r-cran-plotrix' 'r-cran-semtools' 'r-cran-vcd' 'r-cran-vcdextra' 'r-cran-gnm')
conflicts=('r-cran-abind' 'r-cran-htmltools' 'r-cran-jsonlite' 'r-cran-yaml' 'r-cran-xtable' 'r-cran-iterators' 'r-cran-arm' 'r-cran-htmlwidgets' 'r-cran-rstudioapi' 'r-cran-rcolorbrewer' 'r-cran-dichromat' 'r-cran-labeling' 'r-cran-pkgmaker' 'r-cran-registry' 'r-cran-rngtools' 'r-cran-gridbase' 'r-cran-foreach' 'r-cran-doparallel' 'r-cran-stringi' 'r-cran-magrittr' 'r-cran-modeltools' 'r-cran-sparsem' 'r-cran-matrixcalc' 'r-cran-mi' 'r-cran-diagrammer' 'r-cran-formula' 'r-cran-proto' 'r-cran-scales' 'r-cran-latticeextra' 'r-cran-acepack' 'r-cran-gtable' 'r-cran-gridextra' 'r-cran-nmf' 'r-cran-irlba' 'r-cran-digest' 'r-cran-rjson' 'r-cran-whisker' 'r-cran-th.data' 'r-cran-sandwich' 'r-cran-zoo' 'r-cran-coda' 'r-cran-pbapply' 'r-cran-mvtnorm' 'r-cran-stringr' 'r-cran-gtools' 'r-cran-matrixmodels' 'r-cran-rcppeigen' 'r-cran-minqa' 'r-cran-nloptr' 'r-cran-reshape2' 'r-cran-coin' 'r-cran-pbkrtest' 'r-cran-quantreg' 'r-cran-colorspace' 'r-cran-psych' 'r-cran-ellipse' 'r-cran-sem' 'r-cran-plyr' 'r-cran-hmisc' 'r-cran-igraph' 'r-cran-jpeg' 'r-cran-png' 'r-cran-sna' 'r-cran-corpcor' 'r-cran-ggplot2' 'r-cran-glasso' 'r-cran-huge' 'r-cran-fdrtool' 'r-cran-d3network' 'r-cran-ggm' 'r-cran-elliptic' 'r-cran-contfrac' 'r-cran-desolve' 'r-cran-mnormt' 'r-cran-pbivnorm' 'r-cran-quadprog' 'r-cran-estimability' 'r-cran-multcomp' 'r-cran-lmtest' 'r-cran-qvcalc' 'r-cran-relimp' 'r-cran-bayesfactor' 'r-cran-lme4' 'r-cran-rcpp' 'r-cran-rinside' 'r-cran-afex' 'r-cran-base64' 'r-cran-car' 'r-cran-effects' 'r-cran-qgraph' 'r-cran-hypergeo' 'r-cran-lavaan' 'r-cran-logspline' 'r-cran-lsmeans' 'r-cran-plotrix' 'r-cran-semtools' 'r-cran-vcd' 'r-cran-vcdextra' 'r-cran-gnm')


prepare(){
	mkdir -p $srcdir/usr/lib/R/library/
}

build(){
	cd $srcdir
	_libraryPath=$srcdir/usr/lib/R/library/
	Rscript rbundle.R $_libraryPath
}

package(){
	cp -r $srcdir/usr $pkgdir/
}	
md5sums=('d6e6072fc775909ce44462b2dd18a355')

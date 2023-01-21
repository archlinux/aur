# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=signeR
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=1
pkgdesc='Empirical Bayesian approach to mutational signature discovery'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-ada
  r-biocfilecache
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsplus
  r-clue
  r-cowplot
  r-dplyr
  r-dt
  r-e1071
  r-future
  r-future.apply
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-glmnet
  r-iranges
  r-kknn
  r-listenv
  r-magrittr
  r-maxstat
  r-nloptr
  r-nmf
  r-pheatmap
  r-pmcmrplus
  r-ppclust
  r-proc
  r-proxy
  r-pvclust
  r-randomforest
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-readr
  r-reshape2
  r-rtracklayer
  r-scales
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinywidgets
  r-survivalanalysis
  r-survminer
  r-tibble
  r-tidyr
  r-variantannotation
  r-vgam
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43da26c1e05b3d178e9227ce39a3abc5f70c1f5ae9ef19dfa990c9357b51fada')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

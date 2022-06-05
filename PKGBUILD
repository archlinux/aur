# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.28.1
pkgname=r-${_pkgname,,}
pkgver=1.28.1
pkgrel=3
pkgdesc='Tools for the Differential Analysis of Proteins Abundance with R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-apcluster
  r-biobase
  r-cairo
  r-clusterprofiler
  r-cp4p
  r-dapardata
  r-dendextend
  r-diptest
  r-doparallel
  r-dplyr
  r-factoextra
  r-factominer
  r-forcats
  r-foreach
  r-ggplot2
  r-gplots
  r-graph
  r-highcharter
  r-igraph
  r-imp4p
  r-impute
  r-knitr
  r-limma
  r-lme4
  r-mfuzz
  r-msnbase
  r-multcomp
  r-norm
  r-openxlsx
  r-pcamethods
  r-png
  r-preprocesscore
  r-purrr
  r-rcolorbrewer
  r-readxl
  r-reshape2
  r-scales
  r-siggenes
  r-stringr
  r-tibble
  r-tidyr
  r-tidyverse
  r-tmvtnorm
  r-vioplot
  r-visnetwork
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ae8c27c13843ce973d37cf34bf1782e35351d768822ccc432835f378e34f10e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

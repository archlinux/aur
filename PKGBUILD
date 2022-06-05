# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChromSCape
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Analysis of single-cell epigenomics datasets with a Shiny App'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-batchelor
  r-biocparallel
  r-colorramps
  r-colourpicker
  r-consensusclusterplus
  r-coop
  r-delayedarray
  r-dplyr
  r-dt
  r-edger
  r-forcats
  r-fs
  r-genomicranges
  r-ggplot2
  r-iranges
  r-irlba
  r-jsonlite
  r-kableextra
  r-matrixtests
  r-msigdbr
  r-plotly
  r-qs
  r-qualv
  r-rcpp
  r-rlist
  r-rsamtools
  r-rtracklayer
  r-rtsne
  r-s4vectors
  r-scater
  r-scran
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinydashboardplus
  r-shinyfiles
  r-shinyhelper
  r-shinyjs
  r-shinywidgets
  r-singlecellexperiment
  r-stringdist
  r-summarizedexperiment
  r-sushi
  r-tibble
  r-tidyr
  r-umap
  r-viridis
  r-gggenes
)
optdepends=(
  r-biocstyle
  r-future
  r-knitr
  r-markdown
  r-rmarkdown
  r-signac
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('30abed31221e86e32a21a32f2e2c6428bf67eeb31965da468d8b56aa2f057343')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

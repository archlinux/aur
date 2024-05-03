# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChromSCape
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
  r-gggenes
  r-ggplot2
  r-ggrepel
  r-gridextra
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
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-umap
  r-viridis
)
optdepends=(
  r-biocstyle
  r-bluster
  r-future
  r-httr
  r-igraph
  r-knitr
  r-markdown
  r-rmarkdown
  r-signac
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f93bb82029ca7bedf6d8783121e16de3cd499206c0510c6e31a762cb5f549089')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

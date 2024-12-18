# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TCGAbiolinks
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=2.34.0
pkgrel=1
pkgdesc='TCGAbiolinks: An R/Bioconductor package for integrative analysis with GDC data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-downloader
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-httr
  r-iranges
  r-jsonlite
  r-knitr
  r-plyr
  r-purrr
  r-r.utils
  r-readr
  r-rvest
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tcgabiolinksgui.data
  r-tibble
  r-tidyr
  r-xml
  r-xml2
)
optdepends=(
  r-affy
  r-annotationhub
  r-biobase
  r-biocstyle
  r-c3net
  r-circlize
  r-clusterprofiler
  r-complexheatmap
  r-consensusclusterplus
  r-devtools
  r-dnet
  r-doparallel
  r-edaseq
  r-edger
  r-experimenthub
  r-genefilter
  r-ggrepel
  r-grid
  r-gridextra
  r-igraph
  r-jpeg
  r-limma
  r-maftools
  r-minet
  r-parallel
  r-parmigene
  r-pathview
  r-png
  r-rmarkdown
  r-scales
  r-sesame
  r-seurat
  r-suprahex
  r-survival
  r-survminer
  r-sva
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('843fc8925679a8e13cf123bb4b692d7041896d77495479d509cd4f53d2493367')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

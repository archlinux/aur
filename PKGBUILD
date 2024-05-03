# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=musicatk
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Mutational Signature Comprehensive Analysis Toolkit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.mmusculus.ucsc.mm9
  r-complexheatmap
  r-data.table
  r-decomptumor2sig
  r-deconstructsigs
  r-dplyr
  r-factoextra
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-gridextra
  r-gtools
  r-iranges
  r-maftools
  r-magrittr
  r-matrixtests
  r-mcmcprecision
  r-nmf
  r-philentropy
  r-plotly
  r-rlang
  r-s4vectors
  r-shiny
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyverse
  r-topicmodels
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-uwot
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-covr
  r-cowplot
  r-knitr
  r-qpdf
  r-rmarkdown
  r-shinyalert
  r-shinybs
  r-shinybusy
  r-shinydashboard
  r-shinyjqui
  r-shinyjs
  r-shinywidgets
  r-sortable
  r-survival
  r-tcgabiolinks
  r-testthat
  r-withr
  r-xvector
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4be4a5746dee72b8aede9b1074cc9c20e00de0db7283bfab27f496790561e8d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

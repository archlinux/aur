# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=musicatk
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
  r-cowplot
  r-data.table
  r-decomptumor2sig
  r-deconstructsigs
  r-dplyr
  r-factoextra
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
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
  r-shinyalert
  r-shinybs
  r-shinybusy
  r-shinydashboard
  r-shinyjqui
  r-shinyjs
  r-sortable
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-tcgabiolinks
  r-tibble
  r-tidyr
  r-topicmodels
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-uwot
  r-variantannotation
  r-withr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-qpdf
  r-rmarkdown
  r-survival
  r-testthat
  r-xvector
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eeb5f9421f82f600e42be4369e196aa432a48d1c14176690bf9b4726e19485d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

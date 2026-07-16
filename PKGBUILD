# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidybulk
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Brings transcriptomics to the tidyverse'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-crayon
  r-dplyr
  r-genomicranges
  r-lifecycle
  r-magrittr
  r-preprocesscore
  r-purrr
  r-readr
  r-rlang
  r-s4vectors
  r-scales
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-ttservice
)
optdepends=(
  r-annotationdbi
  r-betareg
  r-biocmanager
  r-biocstyle
  r-boot
  r-broom
  r-clusterprofiler
  r-covr
  r-deseq2
  r-devtools
  r-e1071
  r-edger
  r-egsea
  r-functional
  r-ggally
  r-ggplot2
  r-ggrepel
  r-glmmseq
  r-here
  r-igraph
  r-iranges
  r-kernsmooth
  r-knitr
  r-limma
  r-lme4
  r-markdown
  r-mass
  r-matrixstats
  r-msigdbr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pasilla
  r-pbapply
  r-pbmcapply
  r-qpdf
  r-rsubread
  r-rtsne
  r-seurat
  r-survival
  r-survminer
  r-sva
  r-testthat
  r-tidyheatmap
  r-tidysummarizedexperiment
  r-uwot
  r-vctrs
  r-widyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b9b1c8ec1519905d51ec384ec27a57333d900150662dccbdf49699b091a720e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

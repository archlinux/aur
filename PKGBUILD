# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidybulk
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-igraph
  r-kernsmooth
  r-knitr
  r-limma
  r-markdown
  r-matrixstats
  r-msigdbr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pasilla
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
sha256sums=('d51fe4171ab3493f361acbfb842e39f7fe9eef71a551ca54765a6d0dd769f8ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

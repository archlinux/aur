# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MicrobiotaProcess
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=1
pkgdesc='an R package for analysis, visualization and biomarker discovery of microbiome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biostrings
  r-cli
  r-coin
  r-data.table
  r-dplyr
  r-dtplyr
  r-foreach
  r-ggfun
  r-ggplot2
  r-ggrepel
  r-ggsignif
  r-ggstar
  r-ggtree
  r-ggtreeextra
  r-magrittr
  r-patchwork
  r-pillar
  r-plyr
  r-rlang
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-tidytree
  r-treeio
  r-vegan
  r-zoo
)
optdepends=(
  r-aplot
  r-biocmanager
  r-biomformat
  r-decipher
  r-dirichletmultinomial
  r-forcats
  r-ggalluvial
  r-ggh4x
  r-gghalves
  r-ggnewscale
  r-ggpp
  r-ggside
  r-ggupset
  r-ggvenndiagram
  r-glue
  r-hopach
  r-jsonlite
  r-knitr
  r-nlme
  r-parallel
  r-phangorn
  r-phyloseq
  r-prettydoc
  r-purrr
  r-randomforest
  r-rmarkdown
  r-s4vectors
  r-scales
  r-seqmagick
  r-shadowtext
  r-testthat
  r-withr
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('62da67f40778fdff57b137c6cfcbaf5a44e98453724f940d02a933921b99b47d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

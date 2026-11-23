# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichplot
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='Visualization of Functional Enrichment Result'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aplot
  r-dose
  r-ggfun
  r-ggnewscale
  r-ggplot2
  r-ggtree
  r-gosemsim
  r-igraph
  r-purrr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-scatterpie
  r-yulab.utils
  r-ggtangle
  r-dplyr
  r-enrichit
  r-ggrepel
  r-tidydr
)
optdepends=(
  r-annotationdbi
  r-clusterprofiler
  r-europepmc
  r-ggarchery
  r-ggforce
  r-gghoriplot
  r-ggplotify
  r-ggridges
  r-ggstar
  r-ggtreeextra
  r-ggupset
  r-glue
  r-gridextra
  r-gson
  r-org.hs.eg.db
  r-quarto
  r-scales
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abab78cd8a3620558056ffeb15073e579d3a8a0faf9403278752977c9f02d8cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

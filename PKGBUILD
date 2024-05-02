# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rrvgo
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Reduce + Visualize GO'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-ggplot2
  r-ggrepel
  r-go.db
  r-gosemsim
  r-pheatmap
  r-shiny
  r-tm
  r-treemap
  r-wordcloud
  r-umap
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-dose
  r-dt
  r-heatmaply
  r-knitr
  r-magrittr
  r-org.ag.eg.db
  r-org.at.tair.db
  r-org.bt.eg.db
  r-org.ce.eg.db
  r-org.cf.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.eck12.eg.db
  r-org.ecsakai.eg.db
  r-org.gg.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.mmu.eg.db
  r-org.pt.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-org.ss.eg.db
  r-org.xl.eg.db
  r-plotly
  r-rmarkdown
  r-shinydashboard
  r-slam
  r-testthat
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7718e5b91a1a1e602fc94b8d9468db58d4307ac27d06e5216ceb475d7a67698c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

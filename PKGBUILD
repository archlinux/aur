# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=systemPipeShiny
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='systemPipeShiny: An Interactive Framework for Workflow Management and Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-bsplus
  r-crayon
  r-dplyr
  r-drawer
  r-dt
  r-ggplot2
  r-glue
  r-htmltools
  r-magrittr
  r-openssl
  r-plotly
  r-r6
  r-rlang
  r-rsqlite
  r-rstudioapi
  r-shiny
  r-shinyace
  r-shinydashboard
  r-shinydashboardplus
  r-shinyfiles
  r-shinyjqui
  r-shinyjs
  r-shinytoastr
  r-shinywidgets
  r-spscomps
  r-spsutil
  r-stringr
  r-styler
  r-tibble
  r-vroom
  r-yaml
)
optdepends=(
  r-ape
  r-biocstyle
  r-callr
  r-cicerone
  r-deseq2
  r-esquisse
  r-fs
  r-glmpca
  r-grid
  r-knitr
  r-pheatmap
  r-pushbar
  r-r.utils
  r-readr
  r-rhandsontable
  r-rmarkdown
  r-rtsne
  r-summarizedexperiment
  r-systempiper
  r-systempiperdata
  r-testthat
  r-tidyr
  r-upsetr
  r-zip
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee7594ef1dea8e1e9922083e207487cdde395a2e3d294b651ff24af17a558f93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

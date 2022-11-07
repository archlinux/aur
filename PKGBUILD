# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatialHeatmap
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='spatialHeatmap'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-biocparallel
  r-data.table
  r-dplyr
  r-dynamictreecut
  r-edger
  r-flashclust
  r-genefilter
  r-ggdendro
  r-ggplot2
  r-ggplotify
  r-gplots
  r-gridextra
  r-grimport
  r-htmlwidgets
  r-igraph
  r-limma
  r-plotly
  r-rappdirs
  r-reshape2
  r-rsvg
  r-s4vectors
  r-scater
  r-scran
  r-scuttle
  r-shiny
  r-shinydashboard
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-upsetr
  r-visnetwork
  r-wgcna
  r-xml2
  r-yaml
)
optdepends=(
  r-av
  r-biobase
  r-biocgenerics
  r-biocsingular
  r-biocstyle
  r-deseq2
  r-distinct
  r-dt
  r-expressionatlas
  r-geoquery
  r-hdf5array
  r-htmltools
  r-kableextra
  r-knitr
  r-magick
  r-proc
  r-rmarkdown
  r-rols
  r-runit
  r-shinybs
  r-shinyjs
  r-shinywidgets
  r-sortable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7e9eb606f654d75e701bbfa1295be2958fa8d92aa1892736d3b64b8adaf986b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

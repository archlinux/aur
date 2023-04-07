# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=stars
_pkgver=0.6-1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Spatiotemporal Arrays, Raster and Vector Data Cubes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-abind
  r-classint
  r-lwgeom
  r-rlang
  r-sf
  r-units
)
optdepends=(
  r-cairo
  r-clue
  r-covr
  r-cubelyr
  r-digest
  r-dplyr
  r-exactextractr
  r-fnn
  r-future.apply
  r-ggforce
  r-ggplot2
  r-ggthemes
  r-gstat
  r-httr
  r-jsonlite
  r-knitr
  r-mapdata
  r-maps
  r-ncdfgeom
  r-ncmeta
  r-pbapply
  r-pcict
  r-plm
  r-randomforest
  r-raster
  r-rgdal
  r-rmarkdown
  r-rnetcdf
  r-sp
  r-spacetime
  r-spatstat
  r-spatstat.geom
  r-starsdata
  r-terra
  r-testthat
  r-tidyr
  r-viridis
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f78db3adab9ebbfc9d98c6cc592708d893b5d7fd7fd876af454042ef42204a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

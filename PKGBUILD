# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=performance
_pkgver=0.10.2
pkgname=r-${_pkgname,,}
pkgver=0.10.2
pkgrel=1
pkgdesc='Assessment of Regression Models Performance'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayestestr
  r-datawizard
  r-insight
)
optdepends=(
  r-aer
  r-afex
  r-bayesfactor
  r-bayesplot
  r-betareg
  r-bigutilsr
  r-blavaan
  r-boot
  r-brms
  r-car
  r-compquadform
  r-correlation
  r-cplm
  r-dbscan
  r-estimatr
  r-fixest
  r-forecast
  r-gamm4
  r-ggplot2
  r-glmmtmb
  r-graphics
  r-httr
  r-ics
  r-icsoutlier
  r-islr
  r-lavaan
  r-lme4
  r-lmtest
  r-loo
  r-magrittr
  r-mass
  r-matrix
  r-mclust
  r-metafor
  r-mgcv
  r-mlogit
  r-multimode
  r-nlme
  r-nonnest2
  r-ordinal
  r-parallel
  r-parameters
  r-patchwork
  r-poorman
  r-pscl
  r-psych
  r-randomforest
  r-rmarkdown
  r-rstanarm
  r-rstantools
  r-sandwich
  r-see
  r-survey
  r-survival
  r-testthat
  r-tweedie
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4200c7f59d9eb2466ba2b95ca74beb244e461ad8b21401bc064eabe0f02d3d65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

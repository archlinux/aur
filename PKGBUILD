# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=bayestestR
_pkgver=0.15.0
pkgname=r-${_pkgname,,}
pkgver=0.15.0
pkgrel=1
pkgdesc='Understand and Describe Bayesian Models and Posterior Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-datawizard
  r-insight
)
optdepends=(
  r-bayesfactor
  r-bayesplot
  r-bayesqr
  r-bh
  r-blavaan
  r-bridgesampling
  r-brms
  r-curl
  r-effectsize
  r-emmeans
  r-gamm4
  r-ggdist
  r-ggplot2
  r-glmmtmb
  r-httr
  r-kernsmooth
  r-knitr
  r-lavaan
  r-lme4
  r-logspline
  r-mass
  r-mclust
  r-mediation
  r-modelbased
  r-parameters
  r-patchwork
  r-performance
  r-posterior
  r-quadprog
  r-rcppeigen
  r-rmarkdown
  r-rstan
  r-rstanarm
  r-see
  r-testthat
  r-tweedie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('839ed3c76ae5c31b325f604dd2c4b73e361b2f4d0e6a48bec98a9240dc3679f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

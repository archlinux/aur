# system requirements: pandoc (>= 1.12.3) suggested for using wordregfunction; LaTeX packages tikz, booktabs, dcolumn, rotating,thumbpdf, longtable, paralist for the vignette
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=texreg
_pkgver=1.39.4
pkgname=r-${_pkgname,,}
pkgver=1.39.4
pkgrel=1
pkgdesc='Conversion of R Regression Output to LaTeX or HTML Tables'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-httr
)
optdepends=(
  'pandoc: suggested for using wordregfunction'
  r-aer
  r-alpaca
  r-bergm
  r-betareg
  r-bife
  r-biglm
  r-brglm
  r-brms
  r-broom
  r-btergm
  r-coda
  r-dynlm
  r-eha
  r-erer
  r-ergm
  r-feisr
  r-fgarch
  r-fixest
  r-forecast
  r-gamlss
  r-gamlss.inf
  r-gee
  r-ggplot2
  r-glmmtmb
  r-gmm
  r-gnm
  r-h2o
  r-huxtable
  r-knitr
  r-latentnet
  r-lfe
  r-lme4
  r-lmtest
  r-lqmm
  r-maxlik
  r-metasem
  r-mfx
  r-mhurdle
  r-miceadds
  r-mlogit
  r-mnlogit
  r-mumin
  r-nlme
  r-nnet
  r-oglmx
  r-ordinal
  r-pglm
  r-plm
  r-relevent
  r-rmarkdown
  r-rms
  r-robust
  r-sandwich
  r-simex
  r-spatialreg
  r-spdep
  r-speedglm
  r-survival
  r-testthat
  r-truncreg
  r-vgam
  r-zelig
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3eb2dd3962652bd1b31389355cc2ecae680ae4fde91c7156454a6614e43983c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-riakcs
_gemname=fog-riakcs
pkgver=0.1.0
pkgrel=1
pkgdesc="This library can be used as a module for fog or as standalone provider to use the Riakcs in applications."
arch=('any')
url="https://github.com/fog/fog-riakcs"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
sha512sums=('3a65da9a72c6a18c7cc1879aa5019ce7c2f7b0430aed6539e9d6c6e54e00cb1093cede01dc7161f843aa95169b5b434bff9672a2591c14b2dbfdc6f128428bff')

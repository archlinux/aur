# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-terremark
_gemname=fog-terremark
pkgver=0.1.0
pkgrel=1
pkgdesc="This library can be used as a module for fog or as standalone provider to use the Terremark vCloud in applications."
arch=('any')
url="https://github.com/fog/fog-terremark"
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
sha512sums=('9ac3f9ad10bfcedf5e85b26ac8f7efa5d93e3dea4bca31e717b4a19839edfc961ae7774e4e1547aa62cdda13de301efdd42adfa3049188b4068b6b9aa910c76c')

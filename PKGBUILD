# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-powerdns
_gemname=fog-powerdns
pkgver=0.1.1
pkgrel=1
pkgdesc="This library can be used as a module for 'fog' or as a standalone provider to use PowerDNS DNS services in applications."
arch=('any')
url="https://github.com/fog/fog-powerdns"
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
sha512sums=('3d82420563731fcd52ebf29c32d81586ccb583ca50e63e68ed1beb8ad0f68ee57cf11a7e78b3f20d844e76215fad52744d26650156c8740b1e8e5ba74091d6fd')

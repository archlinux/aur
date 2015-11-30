# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-excon
_gemname=excon
pkgver=0.45.4
pkgrel=1
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/geemus/excon"
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
sha512sums=('e723b974de1bd90fb4d3acc014788e553d41b936d6e18464b5b821444966eafb6f8ccaf559f939f096691fbfe3e771f508b20188d1216a86612116eef55d99c1')

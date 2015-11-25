# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-serverlove
_gemname=fog-serverlove
pkgver=0.1.2
pkgrel=1
pkgdesc="This library can be used as a module for fog or as standalone provider to use the ServerLove in applications."
arch=('any')
url="https://github.com/fog/fog-serverlove"
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
sha512sums=('42a31269e22bb085b864503db1619e99abc705ec335eba7296df629122dc5255e5e1b2696ab79d472cc0d3dcca981730f9564b986baf7651826eb5ca145fa2ba')

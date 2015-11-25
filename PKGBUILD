# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-storm_on_demand
_gemname=fog-storm_on_demand
pkgver=0.1.1
pkgrel=1
pkgdesc="This library can be used as a module for fog or as standalone provider to use the StormOnDemand in applications."
arch=('any')
url="https://github.com/fog/fog-storm_on_demand"
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
sha512sums=('eb55981f87a083150b8de7062a6af7880579eeb0af8e02fc3c88ff935f58c29e53b6aa5c6ca3dfe52ed0bc074d9425343754e48ba081e6e799ded496c10fdecf')

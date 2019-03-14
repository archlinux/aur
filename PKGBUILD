# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-excon
_gemname=excon
pkgver=0.62.0
pkgrel=1
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/geemus/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
sha512sums=('5312932436c0b8807c1ebe1694de40d4f1705233f414e24bfdc91b8693afbbf811b8041187051e59c1ceba038bf1d28c2fa0aa37872e8fa5b292558269a4b7a9')

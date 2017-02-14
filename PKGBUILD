# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-excon
_gemname=excon
pkgver=0.55.0
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
sha512sums=('989457fc819efb889b91697e750f2ef838b3697f1d1978ecee11bd92eb7c5dd3918a35bfb81231e858ed748272d8641b43f96b99d0b338aa987c9ace37414be1')

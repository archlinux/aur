# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-excon
_gemname=excon
pkgver=0.64.0
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
sha512sums=('b6aa277794a970d51a34eac6f1f5ce85f5cb327d0c50bc4df328a02d9d5320e00248a22178dbb76a7a46e4a1b0db4cdd40e150ef393e860861affe6f4db4cb00')

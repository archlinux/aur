# Contributor: Liganic <liganic-aur@gmx.net>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>

pkgname=ruby-archive-tar-minitar
_gemname=${pkgname#ruby-}
pkgver=0.6.1
pkgrel=2
pkgdesc="A pure-Ruby library and command-line utility that provides the ability to deal with POSIX tar(1) archive files."
arch=('any')
url="https://rubygems.org/gems/archive-tar-minitar"
license=('GPL2' 'RUBY')
depends=('ruby' 'rubygems')
makedepends=('ruby-rdoc')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
sha512sums=('286ffeb8dadf3714c7bde838b2417d3a781a99b176046ddc7890e6dfc01e96b2d015fb15443180dd8d2458489c386e397578c079cd5735d331caf0840257fc47')
sha512sums=('286ffeb8dadf3714c7bde838b2417d3a781a99b176046ddc7890e6dfc01e96b2d015fb15443180dd8d2458489c386e397578c079cd5735d331caf0840257fc47')
sha512sums=('286ffeb8dadf3714c7bde838b2417d3a781a99b176046ddc7890e6dfc01e96b2d015fb15443180dd8d2458489c386e397578c079cd5735d331caf0840257fc47')

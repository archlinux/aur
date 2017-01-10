# RubyGems PKGBUILD Generator
# Bash Booster <booster.sdk@gmail.com>

_pkgname=("slop")
pkgname=("ruby-${_pkgname}")
pkgver=4.4.1
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="http://github.com/leejarvis/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/slop-4.4.1.gem")
sha256sums=("bd2ef8b4d884819695d94f05cc1f09032e153c5b6260a864c7ea1514048cd01f")
noextract=("${_pkgname}-${pkgver}.gem")

package() {
 local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
 gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "${_pkgname}-${pkgver}.gem"
}

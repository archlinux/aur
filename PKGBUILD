# Maintainer: Wink Saville <wink@saville.com>
pkgname=ponyc-rpm
_ver="0.20.0"
_ver_sig="4003.0b2a2d2"
pkgver="${_ver}_${_ver_sig}"
pkgrel=1
pkgdesc="An actor model, capabilities, high performance programming language (bintray rpm binaries)"
arch=('x86_64')
url="https://www.ponylang.org/"
license=('BSD')
depends=('zlib' 'ncurses5-compat-libs')
provides=("ponyc=$_ver")
conflicts=('ponyc')
source_x86_64=("https://dl.bintray.com/pony-language/ponyc-rpm/ponyc-${_ver}-${_ver_sig}.x86_64.rpm")
sha256sums_x86_64=('0b7dd70759603535061a19d47d12f8059656880dcb9d00550dd833c515125fcf')
source=("https://raw.githubusercontent.com/ponylang/ponyc/${_ver}/LICENSE")
sha256sums=('c22151b202623f11638a8f6e3eb07c5767b941b75e7585f2e270d5b87f72758a')

package() {
  cp -a "usr" "$pkgdir/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

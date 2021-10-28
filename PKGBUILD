# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tiny-irc-client-bin
_pkgname=tiny
pkgver=0.9.0
pkgrel=2
pkgdesc='tiny is an IRC client written in Rust.'
arch=('x86_64')
license=('MIT')
provides=('tiny-irc-client')
url="https://github.com/osa1/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/tiny-ubuntu-20.04-libssl-dbus.tar.gz"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'caebb955d508abcfb9e8ce0d5df7ec17cbed0c1af53b8ec7b2fbaa74335bd3b7'
  '63e11c8b2708b26311f97d8bef5fba4618ff4212b0b98c21e8ad005a2fd8fe32'
)

package() {
  install -Dm755 "$srcdir/tiny" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

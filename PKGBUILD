# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tiny-irc-client-bin
_pkgname=tiny
pkgver=0.10.0
pkgrel=1
pkgdesc='tiny is an IRC client written in Rust.'
arch=('x86_64')
license=('MIT')
provides=('tiny-irc-client')
url="https://github.com/osa1/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/tiny-ubuntu-20.04-libssl-dbus.tar.gz"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('48e0bab1165d5102de5894bfb99218371464dd8ea867654516b9f8236aff3e3b'
            '7f4751b5e34057ba65e86f3819f2ae8288307a5a8e83e5fbb2733759c8100cb7')

package() {
  install -Dm755 "$srcdir/tiny" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tiny-irc-client-bin
_pkgname=tiny
pkgver=0.8.0
pkgrel=1
pkgdesc='tiny is an IRC client written in Rust.'
arch=('x86_64')
license=('MIT')
conflicts=('tiny-irc-client' 'tiny-irc-client-git')
url="https://github.com/osa1/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/tiny-ubuntu-18.04-libssl-dbus.tar.gz"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '9c725cc1e3ef658d1a343e8afcdd9b94a53d4c55948a50cea670d348933c18f1'
  'acaf0b7c3515bdfd0c80b4a7274aec44d283025c6e40508e450525167f73e447'
)

package() {
  install -Dm755 "$srcdir/tiny" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

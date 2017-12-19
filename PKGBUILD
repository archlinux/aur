#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="1.0.0"
pkgrel=2
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

_vername="$pkgver-rc${pkgrel}"
source=(
    "https://github.com/klinker-apps/messenger-issues/releases/download/v${_vername}/pulse-sms-${_vername}-amd64.deb"
)
sha512sums=("8813abddc69dec231f8c79bce73b5ae155303e726291ef8e9bef5af70fe741379bc48d49ed1a6edbcd8f1f0ba02d0354d5d0a58e64b5a071d3719d3b9fa9c59a")

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

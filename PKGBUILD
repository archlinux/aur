#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="1.0.0"
pkgrel=3
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

_vername="$pkgver-rc${pkgrel}"
source=(
    "https://github.com/klinker-apps/messenger-issues/releases/download/v${_vername}/pulse-sms-${_vername}-amd64.deb"
)
sha512sums=("0450de2c77e8f187c92d10aa5edb978ca9523fe6a166e380e79f4e498b199561796bc58b486d30c1400cf375c5aa0852b12d8858ab5f3b9a8420c0b7932f7156")

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

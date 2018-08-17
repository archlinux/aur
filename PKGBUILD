#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="3.0.1"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "b90ee7cc3a98b63dbb17286f4b896d4a97b17032e275eb19e4af523be88d6b25ac529333c4589646fbecdf2a9b3b59ab1c876d66c46515a80a2eb83d4690afc0"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

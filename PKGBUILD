#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="2.3.1"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "896fc81cea1dab5227b709ce9a4b1c6d5c3e31347d93e70656742a1168f6cd4ea5edee53085fa23bff473ba03597bda98691ca048efbe29451f9b8e8b4cd16ff"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="2.3.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "e45a584be4568d4b5b3aeee9f69051de83d3a37f70c63a0503b5522697bd9825b577c961587eb2c22e5d45f44a8729477e482bbe32333e4d4332a390abf74f01"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

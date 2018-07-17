#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="3.0.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "1f9af44add3d904a143b56b394aa595d9fdb5dd6eb841d49c97ff492dd80f82c328288bc0e1509b850be9282048ef6b77d0784d3df1a8f77bb05c36c5be446fc"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

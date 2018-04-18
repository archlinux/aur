#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="2.1.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "8a0ccb0eaf4017f9c4922fdc8c900123a107bbb23d2882c8726a5c60d3c6b9c0b293a6aac2a037d30e396ab26f0e9891a9afe4fa04f3e0b068280af66459fd7d"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

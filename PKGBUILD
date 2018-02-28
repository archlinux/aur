#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="1.2.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker-apps/messenger-issues/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "4feff1f97356828ce64ce301e8de4f041b6c81f27a2cabe01ee266ad194fd602c26ca8e5ed99259350fb5bc7badd41c5eede873db7c27e27f1fb1d254ed1494a"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

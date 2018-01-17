#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="1.0.1"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker-apps/messenger-issues/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "a71fb8eb2849829024111dda944854d24c49d5e603ba869e3d807501ae11db1e3bd686d7808611b6a211bf4181549c908197a612ef000aa75f021b32487c1876"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

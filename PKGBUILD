#  Maintainer: whight

pkgname="pulse-sms"
pkgver="3.1.4"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "d0141c1257e45baede0f45e02876d006299772f374eb4236a587c8ce46f0829e1d2edb0efa792b10da05c9931f3af80d4a88043960af655189e22daca47621d1"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

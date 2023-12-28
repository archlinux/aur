# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.23.1
_pkgdate=20220112
pkgrel=1
pkgdesc="Leapp is a Desktop DevTool that handles the management and security of your cloud credentials for you, converted from .deb package"
arch=("x86_64")
url="https://www.leapp.cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'at-spi2-core' 'aws-session-manager-plugin')
provides=("$_pkgname")
source=(
    "Leapp_${pkgver}_amd64.deb::https://asset.noovolari.com/${pkgver}/Leapp_${pkgver}_amd64.deb"
)
sha512sums=('06ee3767d74e7e9134b44a1ec0724704576cd9abde6b1f09e9812bd1ded663acb69302b8636b51009ab6109757b66919c359fb89f11f90615c6f07c3985b6e03')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

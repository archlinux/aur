# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.23.0
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
sha512sums=('5b39b4f1d32a076009ecb2f1183fb61e25cb2418131df2bf2ab85f71828b870e201d3138ac2363ca2b797d942613a9ee9d19ea7f585408a3048ab45150ee2d82')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.11.1
_pkgdate=20220112
pkgrel=1
pkgdesc="Leapp is a Desktop DevTool that handles the management and security of your cloud credentials for you, converted from .deb package"
arch=("x86_64")
url="https://www.leapp.cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'at-spi2-core' 'aws-session-manager-plugin')
provides=("$_pkgname")
source=(
    "Leapp_${pkgver}_amd64.deb::https://asset.noovolari.com/latest/Leapp_${pkgver}_amd64.deb"
)
sha512sums=('534f88cace6205d8a6208d1186721ec3b8b6a1eeb2b6cf8d30f6c3fd32332be3085ae517ae94afa17923574a10df51763b8dd907d5dff1be156fc0a6db8531a3')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

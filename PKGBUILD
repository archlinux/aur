# Maintainer: He Qing <qing@he.email>

pkgname=leapp
pkgver=0.8.0
_pkgdate=20220112
pkgrel=1
pkgdesc="Leapp is a Desktop DevTool that handles the management and security of your cloud credentials for you, converted from .deb package"
arch=("x86_64")
url="https://www.leapp.cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'at-spi2-core')
source=(
    "Leapp_${pkgver}_amd64.deb::https://asset.noovolari.com/latest/Leapp_${pkgver}_amd64.deb"
)
sha512sums=('8cd0ec92d7ffb16eb8b188a055de8e53a10246083fe9856b4fe81915d5c7ce8b46b24b101cc6abb93807f0af198620ced8959ecd545e2551c193681e966229f6')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

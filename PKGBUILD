# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.13.2
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
sha512sums=('be17d36fde0b080a651cb82376b4367eef214431334b0e5a093350389a831d63ea8436b16ee3cc753b745cd03aca425f235aad6b368cadca9fa632e3095efd3f')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

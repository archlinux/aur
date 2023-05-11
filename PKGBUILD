# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.17.6
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
sha512sums=('3c875c06ce0c483d03822ef3be43d05bd62737788797d097aae47b010abef79b76e68ad704cf919484e6464d8911e9dd9415a57dc982c46d049539eb478c27f7')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

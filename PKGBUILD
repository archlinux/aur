# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.25.3
_pkgdate=20220112
pkgrel=1
pkgdesc="Leapp is a Desktop DevTool that handles the management and security of your cloud credentials for you, converted from .deb package"
arch=("x86_64")
url="https://www.leapp.cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'at-spi2-core' 'aws-session-manager-plugin')
provides=("$_pkgname")
source=("Leapp_${pkgver}_amd64.deb::https://asset.noovolari.com/${pkgver}/Leapp_${pkgver}_amd64.deb")
sha512sums=('1524850fac25251831532541857bc3f2fa9334d74f3bced6b1b4240f5f51e8c7faa789e694d4d4231fa855d0cd852b74cc83a9ca389ecf07c79422b6b21f6df4')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

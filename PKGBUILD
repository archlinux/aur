# Maintainer: He Qing <qing@he.email>

pkgname=leapp-bin
_pkgname=leapp
pkgver=0.11.0
_pkgdate=20220112
pkgrel=2
pkgdesc="Leapp is a Desktop DevTool that handles the management and security of your cloud credentials for you, converted from .deb package"
arch=("x86_64")
url="https://www.leapp.cloud/"
license=('custom')
depends=('gtk3' 'libxss' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'at-spi2-core' 'aws-session-manager-plugin')
provides=("$_pkgname")
source=(
    "Leapp_${pkgver}_amd64.deb::https://asset.noovolari.com/latest/Leapp_${pkgver}_amd64.deb"
)
sha512sums=('ff68c21b9d90ca401179df5489a5f0b02f43b0c4b822ac57bc1ecaaf605c2f27cc2b451c9e2cbfe82434bd0d2128efd887e9677f04e5ba703a981d624f426993')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
}

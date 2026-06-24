# Maintainer: Debba <debba@example.com>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.13.3
pkgrel=1
pkgdesc="A lightweight, developer-focused database management tool"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('1f1ac7c3629e9f60b466a64ffaa87326d7352f8502349babfc1da847d255f501')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

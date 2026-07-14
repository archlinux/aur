# Maintainer: Debba <debba@example.com>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.15.0
pkgrel=1
pkgdesc="A lightweight, developer-focused database management tool"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('1634b9a72a8624cd6ca3b0d966ea8eb66e365f6e5e04d72d374249a6b1106c62')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

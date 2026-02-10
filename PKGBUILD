# Maintainer: Debba <debba@example.com>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.8.11
pkgrel=1
pkgdesc="A lightweight, developer-focused database management tool"
arch=('x86_64')
url="https://github.com/debba/tabularis"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('4c78eaa105d8d997b3e2bcd87adc5f0c7cfe8a2d9930e4b9ed1428b7670a8eb4')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

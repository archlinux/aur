# Maintainer: Debba <debba@example.com>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.9.3
pkgrel=1
pkgdesc="A lightweight, developer-focused database management tool"
arch=('x86_64')
url="https://github.com/debba/tabularis"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d717249a35daa633b17c076a46da9f629a8bfad8aca1d0d5bebfc330994edae4')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

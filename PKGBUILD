# Maintainer: Debba <debba@example.com>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.9.13
pkgrel=1
pkgdesc="A lightweight, developer-focused database management tool"
arch=('x86_64')
url="https://github.com/debba/tabularis"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b169c36305a355b94cf05b4e604de0073565ad6acb3cda7a4d34fd31fb578248')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

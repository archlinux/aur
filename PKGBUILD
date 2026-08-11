# Maintainer: Debba <andrea@tabularis.dev>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.19.0
pkgrel=1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('006be792f3e27ed1cac0b5d26139e8a082456cbb29ad900b8a7eac1c37f62d77')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

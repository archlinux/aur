# Maintainer: Debba <andrea@tabularis.dev>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.21.0
pkgrel=1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('4e2ff42f973b306ff234a25b0cdb30ca160948a42862f61d89856d9dbbc80b00')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

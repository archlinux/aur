# Maintainer: Debba <andrea@tabularis.dev>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.25.0
pkgrel=1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('ec1f8d4340de386c89cc98d59c8ff1494e9a20746069817b74f03ea8683675fb')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

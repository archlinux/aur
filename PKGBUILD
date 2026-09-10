# Maintainer: Debba <andrea@tabularis.dev>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.23.0
pkgrel=1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('979443452df15aa965a7bfeab11e3dbd82c0c182999e296979e8d7e0d8920481')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Debba <andrea@tabularis.dev>
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.22.0
pkgrel=1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('ce3d06daa9f28b6aeb92e3d5d9f9fe72cda7d078f50416b94dfb302f854c0c12')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

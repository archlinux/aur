# Maintainer: Debba <andrea@tabularis.dev>
# Shared by tabularis-bin (stable) and tabularis-nightly-bin: aur.yml rewrites
# pkgname, pkgver, pkgdesc, _tag and _debver per channel before publishing.
pkgname=tabularis-bin
_pkgname=tabularis
pkgver=0.29.0
pkgrel=1
_tag=v0.29.0
_debver=0.29.0
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${_debver}_amd64.deb::${url}/releases/download/${_tag}/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('dc202164edc8fe3c94116988783d80046ec8bf543b3630e2db6a4acf064a1639')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

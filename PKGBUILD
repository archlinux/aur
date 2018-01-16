# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-bin
pkgver=0.6.0.4
_electronver="0.33.1"
pkgrel=2
pkgdesc="A decentralized currency for the internet."
arch=('x86_64')
url="https://github.com/openvcash/vcash"
license=('AGPL3')
depends=('gcc-libs')
optdepends=("vcash-rpc: rpc command script")
source=("https://github.com/openvcash/vcash-electron/releases/download/v${_electronver}/Vcash-Electron-GUI-${_electronver}-linux64.zip")
conflicts=('vcash')
provides=('vcash')
sha512sums=('a320ea8ec92f5e1d80034982984bc16b3acb27ae9819d18abb3801c06cef72033ea9084ac050b529ab6101251c6af2195129639fee13663c63d6317479b51089')
package() {
	install -Dsm755 "$srcdir/linux-unpacked/resources/app.asar.unpacked/bin/vcashd-x64" "$pkgdir/usr/bin/vcashd"
}

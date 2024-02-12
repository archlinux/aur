# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=teamredminer-bin
_pkgbasename=teamredminer
pkgver=0.10.17
pkgrel=1
pkgdesc="Optimized miner for AMD GPUs"
arch=("x86_64")
url="https://github.com/todxx/teamredminer"
source=("${_pkgbasename}-${pkgver}.tgz::https://github.com/todxx/teamredminer/releases/download/v${pkgver}/teamredminer-v${pkgver}-linux.tgz")
sha256sums=('7ded9330e3278356728a8df6cb2e7b0e69e383caef7557aee87d2919c1a0d8fe')
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/teamredminer-v$pkgver-linux/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/teamredminer" "$pkgdir/usr/bin/teamredminer"
}

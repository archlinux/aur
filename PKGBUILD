# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=teamredminer-bin
_pkgbasename=teamredminer
pkgver=0.8.2.1
pkgrel=1
pkgdesc="Optimized miner for AMD GPUs"
arch=("x86_64")
url="https://github.com/todxx/teamredminer"
source=("${_pkgbasename}-${pkgver}.tgz::https://github.com/todxx/teamredminer/releases/download/${pkgver}/teamredminer-v${pkgver}-linux.tgz")
sha256sums=("7fe52376065086387b182a9c41d476d25d12730f768a7ec422732069e45d7636")
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/teamredminer-v$pkgver-linux/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/teamredminer" "$pkgdir/usr/bin/teamredminer"
}

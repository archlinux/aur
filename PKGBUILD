# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=teamredminer-bin
_pkgbasename=teamredminer
pkgver=0.10.2
pkgrel=1
pkgdesc="Optimized miner for AMD GPUs"
arch=("x86_64")
url="https://github.com/todxx/teamredminer"
source=("${_pkgbasename}-${pkgver}.tgz::https://github.com/todxx/teamredminer/releases/download/v${pkgver}/teamredminer-v${pkgver}-linux.tgz")
sha256sums=('dd3da7bf89f39356df637ccbc318af14b16591b02d3b0cd30add57764693af71')
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/teamredminer-v$pkgver-linux/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/teamredminer" "$pkgdir/usr/bin/teamredminer"
}

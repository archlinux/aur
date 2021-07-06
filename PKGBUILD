# Maintainer: Bruno Jacquet <maxijac at free dot fr>
# Maintainer: pika02 <pikakolendo02 ɑt gmail dοt com>

pkgname=teamredminer
pkgver=0.8.3
pkgrel=0
pkgdesc="Optimized miner for AMD GPUs"
arch=("x86_64")
url="https://github.com/todxx/teamredminer"
source=("${pkgname}-${pkgver}.tgz::https://github.com/todxx/teamredminer/releases/download/v${pkgver}/teamredminer-v${pkgver}-linux.tgz")
sha256sums=("7e5404e6214eedab906abe7971e40de56c2d05dfcb1ddf6dacb434c10cbc1039")
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${pkgname}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/teamredminer-v$pkgver-linux/"* "$pkgdir/opt/${pkgname}"
	ln -s "/opt/${pkgname}/teamredminer" "$pkgdir/usr/bin/teamredminer"
}

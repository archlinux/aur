# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen at gmail dot com>
pkgname=ghidra-xtensa-bin
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="Tensilica Xtensa processor module for Ghidra"
arch=(any)
url="https://github.com/yath/ghidra-xtensa"
license=('MIT')
depends=(ghidra)
makedepends=(unzip)
source=("https://github.com/yath/ghidra-xtensa/releases/download/v$pkgver/ghidra-xtensa-v$pkgver.zip")
md5sums=('4b1cd8fec2834a2651ef577ac0cf8f03')

package() {
	mkdir -p $pkgdir/opt/ghidra/Ghidra/Processors
	cp -rp Xtensa $pkgdir/opt/ghidra/Ghidra/Processors
}

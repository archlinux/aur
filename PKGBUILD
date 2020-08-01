# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=retdec-bin
pkgver=4.0
pkgrel=2
pkgdesc="RetDec is a retargetable machine-code decompiler based on LLVM."
arch=('x86_64')
url="https://github.com/avast/retdec"
license=('MIT')
provides=('retdec')
conflicts=('retdec')
depends=('python')
optdepends=('graphviz' 'upx')
source=("https://github.com/avast/retdec/releases/download/v$pkgver/retdec-v$pkgver-ubuntu-64b.tar.xz")
sha256sums=('02b2c564108038126e70a378631f729abaca52d934afd597522d32843cf900fb')

package() {
  mkdir $pkgdir/usr
  mv $srcdir/retdec/* $pkgdir/usr
}

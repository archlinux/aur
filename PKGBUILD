# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=retdec-bin
pkgver=5.0
pkgrel=1
pkgdesc="RetDec is a retargetable machine-code decompiler based on LLVM."
arch=('x86_64')
url="https://github.com/avast/retdec"
license=('MIT')
provides=('retdec')
conflicts=('retdec')
depends=('python')
optdepends=('graphviz' 'upx')
source=("https://github.com/avast/retdec/releases/download/v$pkgver/RetDec-v$pkgver-Linux-Release.tar.xz")
sha256sums=('e5a7dd82987ff52b8c714892277d0b1d0190ab778c03036d01eb69c7658ab1a5')

package() {
  mkdir $pkgdir/usr
  mv $srcdir/bin $pkgdir/usr/bin
  mv $srcdir/include $pkgdir/usr/include
  mv $srcdir/lib $pkgdir/usr/lib
  mv $srcdir/share $pkgdir/usr/share
}

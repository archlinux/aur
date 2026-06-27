# Maintainer: Sergio Ribera <sergioalejandroriberacosta@gmail.com>
pkgname=sss-nvidia-bin
_pkgname=sss-nvidia
pkgver=0.2.1
pkgrel=1
pkgdesc='Take pretty screenshots of your screen with annotations + CUDA OCR'
arch=('x86_64')
url='https://github.com/SergioRibera/sss'
license=('MIT')
depends=('onnxruntime')
optdepends=('onnxruntime-cuda')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-nvidia-bin-0.2.1-x86_64.tar.gz")
sha256sums=('c2db597c75410fca54447d4fa50d620f7ecd62aa74b7e40c8e1d08a5df34f7d7')


package() {
  cp -a "$srcdir/opt" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/usr" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/lib" "$pkgdir/"  2>/dev/null || true
}

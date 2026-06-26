# Maintainer: Sergio Ribera <sergioalejandroriberacosta@gmail.com>
pkgname=sss-nvidia-bin
_pkgname=sss-nvidia
pkgver=0.2.1
pkgrel=1
pkgdesc='Take pretty screenshots of your screen with annotations + CUDA OCR'
arch=('x86_64')
url='https://github.com/SergioRibera/sss'
license=('MIT')
depends=('glibc')
optdepends=('onnxruntime-cuda')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-nvidia-bin-0.2.1-x86_64.tar.gz")
sha256sums=('0a9b5e688bd30a3545053820a1f7dadf55645a3e86d2caa0c4cda31bc4291a05')


package() {
  cp -a "$srcdir/opt" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/usr" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/lib" "$pkgdir/"  2>/dev/null || true
}

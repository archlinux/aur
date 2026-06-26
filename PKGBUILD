# Maintainer: Sergio Ribera <sergioalejandroriberacosta@gmail.com>
pkgname=sss-rocm-bin
_pkgname=sss-rocm
pkgver=0.2.1
pkgrel=1
pkgdesc='Take pretty screenshots of your screen with annotations + ROCm OCR'
arch=('x86_64')
url='https://github.com/SergioRibera/sss'
license=('MIT')
depends=('glibc')
optdepends=('onnxruntime-rocm' 'rocm-hip-runtime')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-rocm-bin-0.2.1-x86_64.tar.gz")
sha256sums=('a7fec354b87caf5b7c660f3f0234c8ce807e2193fba5c381b93e5d4e3ecdd82f')


package() {
  cp -a "$srcdir/opt" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/usr" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/lib" "$pkgdir/"  2>/dev/null || true
}

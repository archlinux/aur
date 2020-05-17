pkgname=mingw-w64-libvorbis-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw-w64)"
arch=('any')
url="http://www.fftw.org"
license=("GPL")
depends=('mingw-w64-crt'
  'mingw-w64-libogg')
provides=('mingw-w64-libvorbis')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-libvorbis-1.3.6-1-any.pkg.tar.xz")
sha256sums=('SKIP')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    cp -r ./* $pkgdir/usr/${_arch}/
  done
}



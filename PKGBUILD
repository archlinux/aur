# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-spectralizer-bin
pkgver=1.3.4
pkgrel=1
arch=(x86_64)
pkgdesc="Audio visualization for obs-studio using fftw, based on cli-visualizer"
url="https://github.com/univrsal/spectralizer"
license=('GPL2')
depends=("obs-studio" "fftw")
source=("https://github.com/univrsal/spectralizer/releases/download/v$pkgver/spectralizer.v$pkgver.bin.linux.x64.zip")
sha256sums=('3e6b5b36d56ef256b1605028f5baa989cef04d8f4d5cba4b638ac85579dc7d19')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv spectralizer/bin/64bit/spectralizer.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv spectralizer/data $pkgdir/usr/share/obs/obs-plugins/spectralizer
}

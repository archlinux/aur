# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-spectralizer-bin
pkgver=1.3.2
pkgrel=1
arch=(x86_64)
pkgdesc="Audio visualization for obs-studio using fftw, based on cli-visualizer"
url="https://github.com/univrsal/spectralizer"
license=('GPL2')
depends=("obs-studio" "fftw")
source=("https://github.com/univrsal/spectralizer/releases/download/v$pkgver/spectralizer.v$pkgver.bin.linux.x64.zip")
sha256sums=('8680137570ce246846ae51cfe80862ae1662ad8ecc65dc15ac7d67d500dda29a')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv spectralizer/bin/64bit/spectralizer.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv spectralizer/data $pkgdir/usr/share/obs/obs-plugins/spectralizer
}

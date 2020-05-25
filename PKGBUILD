# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-spectralizer-bin
pkgver=1.2
pkgrel=1
arch=(x86_64)
pkgdesc="Audio visualization for obs-studio using fftw, based on cli-visualizer"
url="https://github.com/univrsal/spectralizer"
license=('GPL2')
depends=("obs-studio" "fftw")
source=("https://github.com/univrsal/spectralizer/releases/download/v1.2/spectralizer.v1.2.linux.ubuntu.64.zip")
sha256sums=('090d2dda2bc99ac1213c7ad05aa91749bfd94ed1a3005c4ddd35e0e303e28d53')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv plugin/bin/64bit/spectralizer.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv plugin/data $pkgdir/usr/share/obs/obs-plugins/spectralizer
}

# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-spectralizer-bin
pkgver=1.3.1
pkgrel=1
arch=(x86_64)
pkgdesc="Audio visualization for obs-studio using fftw, based on cli-visualizer"
url="https://github.com/univrsal/spectralizer"
license=('GPL2')
depends=("obs-studio" "fftw")
source=("https://github.com/univrsal/spectralizer/releases/download/v$pkgver/spectralizer.v.$pkgver.bin.linux.x64.zip")
sha256sums=('fe43e781c6421b7f913933c44eae8944abb57f217dda504686b0ee4808866e88')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv spectralizer/bin/64bit/spectralizer.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv spectralizer/data $pkgdir/usr/share/obs/obs-plugins/spectralizer
}

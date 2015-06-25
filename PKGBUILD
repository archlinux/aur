# Maintainer: alexandru.ianu@gmail.com

pkgname=open-fuse-iso
pkgver=1.0
pkgrel=5
pkgdesc="Automatic userspace mounting/unmounting of image files through the open-iso script"
arch=('any')
url="http://forum.manjaro.org/index.php?topic=9306.0"
license=('GPL')
depends=('fuseiso'
         'libnotify')
makedepends=('binutils')
#optdepends=('')
#conflicts=('')
#provides=('')
#replaces=('')
install="$pkgname".install
source=("https://www.dropbox.com/s/o1okqgx1apgqp8i/open-fuse-iso"
	"https://www.dropbox.com/s/wkd70lo3at67oiv/open-fuse-iso.desktop")
md5sums=('6629c2213e9a1d51942ef2c08d849730'
	 'e784d7f56586b3985cd9dbd0447a8f37')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/open-fuse-iso" "$pkgdir/usr/bin/open-fuse-iso"
  chmod +x "$pkgdir/usr/bin/open-fuse-iso"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/open-fuse-iso.desktop" "$pkgdir/usr/share/applications/open-fuse-iso.desktop"
  chmod +x "$pkgdir/usr/share/applications/open-fuse-iso.desktop"
}

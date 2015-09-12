# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade
pkgver=1.2.0
pkgrel=4
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-dbus' 'python2-gnomevfs' 'python2-gobject' 'python2-numpy' 'python2-imaging')
conflicts=('flowblade-hg' 'flowblade-git')
provides=('flowblade')

install=flowblade.install
#https://www.dropbox.com/s/lzwlycblfpgn8vg/flowblade-1.2.0.tar.gz?dl=0
source=(https://www.dropbox.com/s/lzwlycblfpgn8vg/flowblade-$pkgver.tar.gz?dl=0)

package() {
  #cd $srcdir/$pkgname-$pkgver/$pkgname-trunk
  cd $srcdir/$pkgname-$pkgver 
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

md5sums=('8432518e0b99d8d638ac9d5305e4646e')

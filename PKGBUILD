# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade
pkgver=1.0.0
pkgrel=4
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-dbus' 'python2-gnomevfs' 'python2-numpy' 'python2-imaging')
conflicts=('flowblade-hg' 'flowblade-git')
provides=('flowblade')

install=flowblade.install
#source=(https://github.com/jliljebl/flowblade/archive/v$pkgver.tar.gz)
source=(https://www.dropbox.com/s/goligzl0lnhi77k/flowblade-$pkgver.tar.gz?dl=0)

package() {
  #cd $srcdir/$pkgname-$pkgver/$pkgname-trunk
  cd $srcdir/$pkgname-$pkgver 
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

md5sums=('ecd8c5fd13121fd7beca0bce18d1f189')

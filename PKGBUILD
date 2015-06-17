 
pkgname=pyvnc
pkgver=0.1
pkgrel=1
url="http://d-austin.net/pyvnc/"
arch=(i686 x86_64)
license=(GPL)
pkgdesc="a Python wrapper for VNC client operations."
depends=(libvncserver)
makedepends=('python2' 'python2-distribute')
source=("http://d-austin.net/pyvnc/$pkgname-$pkgver.tar.gz")
md5sums=('630884c678507bfa56808edccdfb2d27')

build ()
{
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir

}

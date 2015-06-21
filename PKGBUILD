# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python2-aplpy
pkgver=1.0
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="http://aplpy.sourceforge.net/"
license=("MIT")
depends=('python2' 'python2-matplotlib>=1.0.0' 'python2-numpy>=1.4' 'python2-pyregion' 'python2-pillow' 'python2-astropy' 'python2-pyavm')
source=("https://pypi.python.org/packages/source/A/APLpy/APLpy-$pkgver.tar.gz")
md5sums=('a660dc5a5e62536e32bf61e44a5eb6c8')

package() {
  cd ${srcdir}/APLpy-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

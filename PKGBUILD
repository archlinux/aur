# Contributer: Adria Arrufat <swiftscythe@gmail.com>

pkgname=python2-pylastfp
pkgver=0.6
pkgrel=1
pkgdesc="A Python interface to Last.fm's acoustic fingerprinting library and its related API servicesa"
arch=(i686 x86_64)
url="https://pypi.python.org/pypi/pylastfp"
license=('APACHE')
makedepends=('python2')
depends=('python2' 'libsamplerate' 'fftw')
source=(https://pypi.python.org/packages/source/p/pylastfp/pylastfp-${pkgver}.tar.gz)

build() {
  cd $startdir/src/pylastfp-$pkgver
  python2 setup.py install --root=$startdir/pkg --optimize=1
}
md5sums=('292946bd34f24f533029085e063d5155')

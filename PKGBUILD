# Maintainer: M0Rf30

pkgname=python2-gnupg-isis
name=python-gnupg
pkgver=2.2.0
pkgrel=1
pkgdesc='A modified version of python-gnupg, including security patches, extensive documentation, and extra features. The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard.'
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
arch=('any')
depends=('python2' 'gnupg' 'python2-psutil')
conflicts=('python2-gnupg')
provides=('python2-gnupg')
source=("https://github.com/isislovecruft/python-gnupg/archive/$pkgver.tar.gz")

build() {
  cd $name-$pkgver
  python2 setup.py build
}

package() {
  cd $name-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1
}

md5sums=('39095a3479b3d4db33ba6450d7e4da65')

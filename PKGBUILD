# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: M0Rf30

_srcname=python_gnupg-ng
pkgname=python2-gnupg-ng-leap
pkgver=2.0.2
pkgrel=1
pkgdesc='A modified version of python-gnupg, including security patches, extensive documentation, and extra features (LEAP fork).'
url="https://github.com/leapcode/$_srcname"
license=('GPL3')
arch=('any')
depends=('python2' 'gnupg' 'python2-psutil')
conflicts=('python2-gnupg' 'python2-gnupg-isis')
provides=("python2-gnupg=$pkgver")
source=("https://github.com/leapcode/$_srcname/archive/master.zip")
sha256sums=('453bbfdb19d4467f289346c2f0b994ea729b1fafe34fd912a0dab4fe6808e171')

package() {
  cd "$srcdir/$_srcname-master"
  python2 setup.py install --root=$pkgdir --optimize=1
}

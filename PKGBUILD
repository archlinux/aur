# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-facebook-sdk
_pypiname=facebook-sdk
pkgver=0.4.0
pkgrel=1
pkgdesc="Facebook Platform Python SDK"
arch=('any')
url="http://pythonforfacebook.com"
license=('Apache')
depends=('python2')
makedepends=('python2')
conflicts=('python2-facebook-sdk-git' 'facebook-python-sdk-git')
provides=('python2-facebook-sdk')
source=("https://pypi.python.org/packages/source/f/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('ac9f38e197e54b8ba9f3a61988cc33b7')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python2-google-auth
_pkgname=google-auth
pkgver=1.4.1
pkgrel=1
license=('Apache')
pkgdesc='Google Auth Python Library'
makedepends=('python2-setuptools')
depends=('python2'
         'python2-six'
         'python2-rsa'
         'python2-pyasn1-modules'
         'python2-cachetools')
arch=('any')
url='https://github.com/GoogleCloudPlatform/google-auth-library-python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9051802d3dae256036cca9e34633a32c0ed1427730d4ebc513dff91ec8b6dd45')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

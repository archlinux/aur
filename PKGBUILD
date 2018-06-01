# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-google-auth
_pkgname=google-auth
pkgver=1.5.0
pkgrel=1
license=('Apache')
pkgdesc='Google Auth Python Library'
makedepends=('python-setuptools')
depends=('python' 'python-six' 'python-rsa' 'python-pyasn1-modules' 'python-cachetools')
arch=('any')
url='https://github.com/GoogleCloudPlatform/google-auth-library-python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1745c9066f698eac3da99cef082914495fb71bc09597ba7626efbbb64c4acc57')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

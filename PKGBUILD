# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-advocate'
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="A set of tools based around the requests library for safely making HTTP requests on behalf of a third party."
arch=('any')
url="https://github.com/JordanMilne/Advocate"
license=('Apache 2.0')
depends=('python')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ab526c8f094705f97f5ed7db965d98ac2a19d16fe84f834433588065d69975d6efd99466ab69463f9d667bf3cf39afecc00a8686ba6f8314e95ef0ba06d8d7ee')

package() {
  cd advocate-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

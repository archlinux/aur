# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-backoff'
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('799c3d452843eaf26cdf90c02a26d1b9d4c5a4f3c1abd8625f23fa4d6fafcafad1c62ef242efbe23df1bd8ba16548063c6edda25c3c7ddca303ca7b42d7949ac')

package() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

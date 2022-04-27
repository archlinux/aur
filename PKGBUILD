# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-backoff'
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('078ec065e8ec5dd12484069736383f94f9577eb8ebbe95cab29719228cc4c4973f72c89b03831912a9973b81a4cd1cc13de68e548b7221fb28182a2bc37ae498')

package() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

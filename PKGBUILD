# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-loguru
_pkgname=loguru
pkgver=0.6.0
pkgrel=1
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Delgan/loguru/archive/$pkgver.tar.gz")
md5sums=('10d86aa06920ab7c168906830837be58')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

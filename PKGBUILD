# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-loguru
_pkgname=loguru
pkgver=0.4.1
pkgrel=2
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Delgan/loguru/archive/$pkgver.tar.gz")
md5sums=('4c2b338de9e3de4bc46e7ea754ad28d2')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

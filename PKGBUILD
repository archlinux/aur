# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-loguru
_pkgname=loguru
pkgver=0.5.1
pkgrel=1
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Delgan/loguru/archive/$pkgver.tar.gz")
md5sums=('b0585dd440a7d892820d64d93e4e09ea')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

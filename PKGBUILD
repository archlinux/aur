# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-loguru
_pkgname=loguru
pkgver=0.4.0
pkgrel=2
pkgdesc='Python logging made (stupidly) simple'
arch=('any')
url='https://github.com/Delgan/loguru'
license=('MIT')
depends=('python' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Delgan/loguru/archive/$pkgver.tar.gz")
md5sums=('6797d58dbaf883e3305f408034c20892')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
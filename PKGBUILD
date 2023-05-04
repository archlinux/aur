# Maintainer: piernov <piernov@piernov.org>

pkgname=python-ipython-autotime
pkgver=0.3.1
pkgrel=1
pkgdesc="Time everything in IPython"
arch=('any')
url="https://github.com/cpcloud/ipython-autotime"
license=('APACHE')
depends=('ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/26/01/ef9279afb4da30be2cccbf5525886753e35732f89ad60da1a298676dd5a1/ipython-autotime-$pkgver.tar.gz")
sha512sums=('d4fb849689a2dfadfdd56097a109c7a1f84721eca346aa8b71ede0df1df1241a5c320b304521cdb707af568730fe79dec2f9a8c32b2ec97403499ac66e1cff98')

build() {
  cd ipython-autotime-$pkgver
  python setup.py build
}

package() {
  cd ipython-autotime-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}

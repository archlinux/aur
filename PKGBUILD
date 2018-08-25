# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-epc
pkgver=0.0.5
pkgrel=1
pkgdesc="EPC (RPC stack for Emacs Lisp) for Python"
arch=('any')
url="https://github.com/tkf/python-epc"
license=('GPL3')
depends=('python' 'python-sexpdata')
source=("https://pypi.python.org/packages/source/e/epc/epc-${pkgver}.tar.gz")
md5sums=('de54a24ace8a9b3f5b2d8f014b8c4a42')

package() {
  cd epc-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}


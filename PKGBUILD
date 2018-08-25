# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-epc
pkgver=0.0.5
pkgrel=2
pkgdesc="EPC (RPC stack for Emacs Lisp) for Python"
arch=('any')
url="https://github.com/tkf/python-epc"
license=('GPL3')
depends=('python' 'python-sexpdata')
source=("https://pypi.python.org/packages/source/e/epc/epc-${pkgver}.tar.gz")
sha256sums=('a14d2ea74817955a20eb00812e3a4630a132897eb4d976420240f1152c0d7d25')

package() {
  cd epc-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}


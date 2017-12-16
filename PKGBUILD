# Maintainer: Riccardo Berto <riccardo at rcrdbrt dot com>

pkgname=('python-expense_manager')
_pkgname='expense_manager'
pkgver=0.0.1
pkgrel=1
pkgdesc="A command-line expense manager and bank account logger."
arch=('any')
url="https://github.com/RcrdBrt/expense_manager"
license=('MIT')
makedepends=('python')
depends=('python' 'python-dataset' 'python-cmd2' 'python-colorama' 'python-termcolor' 'python-tabulate' 'python-pysqlcipher3')
options=('!emptydirs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


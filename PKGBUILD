pkgname=python312-filelock
pkgver=3.29.0
pkgrel=1
pkgdesc='Platform independent file lock for Python 3.12'
arch=('any')
url='https://github.com/tox-dev/filelock'
license=('Unlicense')
depends=('python312')
makedepends=('python312-installer')
source=("filelock-3.29.0-py3-none-any.whl::https://files.pythonhosted.org/packages/81/47/dd9a212ef6e343a6857485ffe25bba537304f1913bdbed446a23f7f592e1/filelock-3.29.0-py3-none-any.whl")
sha256sums=('96f5f6344709aa1572bbf631c640e4ebeeb519e08da902c39a001882f30ac258')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/filelock-3.29.0-py3-none-any.whl"
}

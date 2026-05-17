pkgname=python312-pyproject-hooks
_name=pyproject_hooks
pkgver=1.2.0
pkgrel=1
pkgdesc='Wrappers to call pyproject.toml-based build backend hooks for Python 3.12'
arch=('any')
url='https://github.com/pypa/pyproject-hooks'
license=('MIT')
depends=('python312')
makedepends=('python312-installer')
source=("pyproject_hooks-1.2.0-py3-none-any.whl::https://files.pythonhosted.org/packages/bd/24/12818598c362d7f300f18e74db45963dbcb85150324092410c8b49405e42/pyproject_hooks-1.2.0-py3-none-any.whl")
sha256sums=('9e5c6bfa8dcc30091c74b0cf803c81fdd29d94f01992a7707bc97babb1141913')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/pyproject_hooks-1.2.0-py3-none-any.whl"
}

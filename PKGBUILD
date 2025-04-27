# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-gdb-types
pkgver=15.0.0.20250321
pkgrel=1
pkgdesc='Typing stubs for gdb'
arch=('any')
url='https://pypi.org/project/types-gdb'
license=('Apache-2.0')
depends=('gdb' 'python')
makedepends=('python-installer' 'python-wheel')
optdepends=()
_filename="types_gdb-${pkgver}-py3-none-any.whl"
noextract=("${_filename}")
source=(
  "${_filename}::https://files.pythonhosted.org/packages/ed/fa/5d822acbecfa20b393af21f1a9e5168733b137f3f32bb24247b0ea9c7fb9/types_gdb-15.0.0.20250321-py3-none-any.whl"
)
sha256sums=('adccc7085b4a4a010273206b5d3e866166018f98fee30adcb8bf47bc9aae837d')

package() {
  # TODO: Licenses.
  # install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir $_filename
}

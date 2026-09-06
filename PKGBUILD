# Maintainer: Adam Weld <weld@valvesoftware.com>
# Maintainer: Christian Marcheselli <christianm@valvesoftware.com>

pkgname=jupiter-fan-control
_srctag=20260902.1
pkgver=${_srctag//-/.}
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Jupiter fan controller"
url='https://github.com/evlav/jupiter-fan-control/-/tree/$_srctag'
depends=('python-pyaml' 'python>=3.10')
sha512sums=(SKIP)
makedepends=('git' 'rsync')

source=("git+https://github.com/evlav/jupiter-fan-control.git#tag=$_srctag")

package() {
   rsync -a --exclude 'README.md' --exclude 'pyproject.toml' "$srcdir"/jupiter-fan-control/* "$pkgdir"
}

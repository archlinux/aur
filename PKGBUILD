# Maintainer: Ivar Kamsvåg <ivar.kamsvag@gmail.com>
pkgname=palex-git
pkgver=v1.0b7
pkgrel=1
pkgdesc="Extends color palettes"
arch=('any')
url="https://gitlab.com/ivakam/palette-extender/"
license=('MIT')
depends=('python' 'python-pywal')
makedepends=('git' 'python-setuptools')
provides=('palex-git')
conflicts=('palex')
options=(!emptydirs)
source=("git+https://gitlab.com/ivakam/palette-extender.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/palette-extender"
  python setup.py install --root="$pkgdir/" --optimize=1
}

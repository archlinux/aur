# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=python-hypyutils
pkgver=1.0.7+7f1eb2b4
pkgrel=1
pkgdesc="HyDEV Utils for Python."
arch=('any')
url='https://github.com/hykilpikonna/HyPyUtils'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

_commit=7f1eb2b44310f3403cbb777e45941a8f891572dc

source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir" --optimize=1
}

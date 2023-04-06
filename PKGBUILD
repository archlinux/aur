# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dg
pkgver=1.1.0.20160916
_commit=9d9a5365c8ee28d4812062db1e9932754260d2d0
pkgrel=7
pkgdesc="A simple language that compiles to CPython bytecode"
arch=('any')
url="https://pyos.github.io/dg"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/pyos/dg.git#commit=$_commit")
md5sums=('SKIP')

package() {
  cd dg
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

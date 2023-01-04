# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-trampoline
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple and tiny yield-based trampoline implementation for python"
arch=('any')
url="https://gitlab.com/ferreum/trampoline"
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha512sums=('c83a396fb746a393d7326c895f647b781d8a9c39ec6a58b85060cbe444ab141f2204f45ee55eefcc67dad6f8bf7ab6da24e96dbd54fb9859b93c359c8b55355c')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}

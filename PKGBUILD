# Maintainer: @aardbol
pkgname=python-patchright-bin
_pkgname=patchright
pkgver=1.63.0
pkgrel=1
pkgdesc='Undetected Python version of the Playwright testing and automation library'
arch=('x86_64')
url='https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-python'
license=('Apache-2.0')
depends=('python' 'python-greenlet' 'python-pyee')
provides=('python-patchright')
conflicts=('python-patchright' 'python-patchright-git')
makedepends=('python-installer')
options=('!strip' '!debug')
_wheel="${_pkgname}-${pkgver}-py3-none-manylinux1_x86_64.whl"
source_x86_64=("${_wheel}::https://files.https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-python.org/packages/py3/p/${_pkgname}/${_wheel}")
sha256sums_x86_64=('1c08a30d0fbd4b76d27fc5b254687ec6311e3da65b6451f55eac1c8ebe81fc15')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"
}

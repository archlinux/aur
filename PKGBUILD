# Maintainer: jakob <grandchild@gmx.net>

_pkgname=clintermission
pkgname=python-${_pkgname}
pkgver=0.3.0
pkgrel=2
pkgdesc="Non-fullscreen command-line selection menu"
arch=(any)
url="https://github.com/sebageek/clintermission"
license=('Apache')
depends=(python python-prompt_toolkit)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d1dc3a7835a00db5d9225ed9ae58bf485c21faafa4168a89cd59b80c969140f8')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

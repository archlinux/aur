# Maintainer: jakob <grandchild@gmx.net>

_pkgname=clintermission
pkgname=python-${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="Non-fullscreen command-line selection menu"
arch=(any)
url="https://github.com/sebageek/clintermission"
license=('Apache')
depends=(python python-prompt_toolkit)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('42b0ffb031c010c1a2a8ace9c560d631abb3b4ba74cc67ff4bcae1fff182a876')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

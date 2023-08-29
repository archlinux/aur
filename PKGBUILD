# Maintainer: jakob <grandchild@gmx.net>

_pkgname=clintermission
pkgname=python-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="Non-fullscreen command-line selection menu"
arch=(any)
url="https://github.com/sebageek/clintermission"
license=('Apache')
depends=(python python-prompt_toolkit)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8b3d15bc8001518215c3ad086a5662979bc3ec2bc059ce737001de1c8f97352a')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

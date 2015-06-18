# Maintainer: Sébastien Luttringer <sebastien.luttringer@arkena.com>

pkgname=python2-sjrpc
pkgver=18
pkgrel=1
pkgdesc='Smartjog Remote Procedure Call'
arch=('any')
url='https://git.arkena.net/cloudcontrol/sjrpc'
license=('GPL2')
depends=('python2' 'python2-pyev')
makedepends=('git' 'python2-setuptools')
source=("git+https://git.arkena.net/cloudcontrol/sjrpc.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd sjrpc
  python2 setup.py build
}

package() {
  cd sjrpc
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

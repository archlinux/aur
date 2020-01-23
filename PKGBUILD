# Maintainer: Sébastien Luttringer <sebastien.luttringer@arkena.com>

pkgname=cc-cli
pkgver=7
pkgrel=4
pkgdesc='CloudControl Command Line Interface'
arch=('any')
url='https://git.seblu.net/mirror/cc-cli'
license=('GPL2')
depends=('python2' 'python2-sjrpc' 'python2-xdg')
makedepends=('git' 'python2-setuptools')
source=("git+https://git.seblu.net/mirror/cc-cli.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

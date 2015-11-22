# $Id$
# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>

pkgname=python2-oauth2client1412
pkgver=1.4.12
pkgrel=2
pkgdesc='A client library for OAuth 2.0'
arch=('any')
url=https://github.com/google/oauth2client
license=('Apache')
makedepends=('git' 'python2-setuptools' 'python2-httplib2' 'python2-pyasn1'
             'python2-pyasn1-modules' 'python2-rsa' 'python2-six')
optdepends=('python2-gflags: for oauth2client.tools.run function')
source=('git+https://github.com/polyzen/oauth2client#branch=python2-1.4.12')
md5sums=('SKIP')

build() {
  cd oauth2client
  python2 setup.py build
}

package() {
  cd oauth2client
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

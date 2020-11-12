# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nose-cover3
pkgver=0.1.0
pkgrel=7
pkgdesc="Coverage 3.x support for Nose"
arch=(any)
url="https://github.com/ask/nosecover3"
license=('LGPL')
options=('!emptydirs')
depends=('python-nose' 'python-coverage')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/ask/nosecover3.git#tag=v$pkgver")
sha512sums=('SKIP')

package() {
  cd nosecover3
  python setup.py install --root="${pkgdir}" --optimize=1
}

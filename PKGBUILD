# Maintainer: Holden Salomon <holden@cryptolab.net>
pkgname=python-hackchat
pkgver=0.1.4
pkgrel=1
pkgdesc="A library to work with hack.chat"
arch=(any)
url="https://github.com/gkbrk/hackchat/"
license=(MIT)
depends=(python python-websocket-client)
makedepends=(git python-setuptools)
options=(!emptydirs)
source=("git+https://github.com/gkbrk/hackchat.git")
md5sums=('SKIP')

pkgver() {
       cd "$srcdir/hackchat"
          python setup.py --version
}

package() {
  cd "$srcdir/hackchat"
  python setup.py install --root="$pkgdir/" --optimize=1
}


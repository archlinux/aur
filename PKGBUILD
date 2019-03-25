# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Karsten Hinz <k.hinz at tu-bs dot de>

pkgname=python2-elib-intl
_pkgname=elib.intl
pkgver=0.0.3
pkgrel=2
pkgdesc="Enhanced internationalization (I18N) services for Python modules and applications"
arch=(any)
url="https://github.com/dieterv/elib.intl"
license=(LGPL)
depends=(python2)
makedepends=(git python2-setuptools)
_commit=d09997cfef8584f9f0bf227752bab890a66a0a61  # master
source=("git+https://github.com/dieterv/elib.intl#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd $_pkgname
  python2 setup.py build
}

package() {
  cd $_pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}

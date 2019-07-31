# Maintainer: Tomasz Zok <tomasz.zok@gmail.com>
pkgname=python-academic-admin
pkgver=0.4.0
pkgrel=1
pkgdesc="An admin tool for Academic website framework"
arch=(any)
url="https://github.com/sourcethemes/academic-admin"
license=(MIT)
groups=()
depends=(python python-bibtexparser python-toml)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/sourcethemes/academic-admin/archive/${pkgver}.tar.gz)
md5sums=('054cd17f747fd9d700e5b6622b69fbc7')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

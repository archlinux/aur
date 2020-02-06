# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mercurial
_pkgname=mercurial
pkgver=5.3
pkgrel=0
pkgdesc='Mercurial for python 3 - python modules only'
arch=(x86_64)
url="https://www.mercurial-scm.org/"
license=(GPL)
provides=(mercurial=$pkgver)
depends=(python)
source=(https://www.mercurial-scm.org/release/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('e57ff61d6b67695149dd451922b40aa455ab02e01711806a131a1e95c544f9b9')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  rm -rf "$pkgdir"/usr/bin
}

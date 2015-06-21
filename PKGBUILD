# Maintainer: Xyne <ca archlinux xyne, backwards>
_pkgname=pyzotero
pkgname=pyzotero-git
pkgver=1363479022
pkgrel=1
pkgdesc="A Python wrapper fro the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('pyzotero')
conflicts=('pyzotero')

source=('git://github.com/urschrei/pyzotero.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd -- "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
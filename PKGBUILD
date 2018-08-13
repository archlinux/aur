# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-ansicolors
_pkgname=ansicolors
pkgver=1.1.8
pkgrel=1
pkgdesc="ANSI colors for Python"
arch=('any')
url="https://github.com/jonathaneunice/colors/"
license=('ISC')
depends=('python2')
makedepends=("python2-distribute")
source=("https://files.pythonhosted.org/packages/76/31/7faed52088732704523c259e24c26ce6f2f33fbeff2ff59274560c27628e/$_pkgname-$pkgver.zip")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha512sums=('5afc4a7a6dc4028ad3db80c0e25e340482295ba41082107287abe7f20f6d4a2d0d17bccf269d7ac71482b7944134487f9238bb2c22c8a2f0bf9ea8288e543378')
sha512sums=('5afc4a7a6dc4028ad3db80c0e25e340482295ba41082107287abe7f20f6d4a2d0d17bccf269d7ac71482b7944134487f9238bb2c22c8a2f0bf9ea8288e543378')

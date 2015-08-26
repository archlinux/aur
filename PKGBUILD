# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: James Campos <james.r.campos@gmail.com>

_pkgname=Pim
pkgname=pim
pkgver=0.7.1
pkgrel=1
pkgdesc="Python image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('python-gobject')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Narrat/Pim/archive/$pkgver.tar.gz")
sha256sums=('0abfd609ce5d9e0a2054a05e1747209c49b8f1a8bcc50e7eb0c8fa4eebdeeb7d')


package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -D -m755 pim $pkgdir/usr/bin/pim
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}

# vim:set ts=2 sw=2 et:

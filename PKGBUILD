# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: James Campos <james.r.campos@gmail.com>

_pkgname=Pim
pkgname=pim
pkgver=0.10.0
pkgrel=1
pkgdesc="Python image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('desktop-file-utils' 'python-gobject')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Narrat/Pim/archive/$pkgver.tar.gz")
sha256sums=('83cc583f880e3f0c5a7ce8a2792459833d926cd1d8b6f4f8d8da61af507f9727')


package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -D -m755 pim $pkgdir/usr/bin/pim
  install -D -m644 LICENSE-MIT $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}

# vim:set ts=2 sw=2 et:

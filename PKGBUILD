# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: James Campos <james.r.campos@gmail.com>

_pkgname=Pim
pkgname=pim
pkgver=0.9.0
pkgrel=1
pkgdesc="Python image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('desktop-file-utils' 'python-gobject')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Narrat/Pim/archive/$pkgver.tar.gz")
sha256sums=('118b574e41bcc5ec12551eca9c2e0e5cd5790a80b90eee7396f498c69b478497')


package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -D -m755 pim $pkgdir/usr/bin/pim
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}

# vim:set ts=2 sw=2 et:

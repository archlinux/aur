# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20250401
pkgrel=1
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL-3.0-or-later)
install="$pkgname.install"
source=(https://f.alhp.dev/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
b2sums=('ecf1ff3d89c9a525b9d23352b4eafe8420d4b1b79f7deec70f213441d55baf94bf8e39fcc6dc4cec225d486ca46e50ceafbcbc797b4edd552923438e74932481'
        'SKIP')
validpgpkeys=('00B25193054EA4BC7BA870848CA32F8BF3BC8088')  # Giovanni Harting <539@idlegandalf.com>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

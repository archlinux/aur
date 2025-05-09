# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20250509
pkgrel=1
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL-3.0-or-later)
install="$pkgname.install"
source=(https://f.alhp.dev/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
b2sums=('1d12ae599d9da533aff66304f3111a19a80c1d132c933488549dd7fc7964a660d58e4d143a88a85f16cb6ef8dc28bab980f8f1702bdf17609e60fa603084bf81'
        'SKIP')
validpgpkeys=('00B25193054EA4BC7BA870848CA32F8BF3BC8088')  # Giovanni Harting <539@idlegandalf.com>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

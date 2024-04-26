# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20240426
pkgrel=2
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL-3.0-or-later)
install="$pkgname.install"
source=(https://f.alhp.dev/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
b2sums=('b33b814a4e03f1684e77bbd6b5f556c9568ee069a6f63416bbc10bb84be19db1b2391d2e100a81b77bde0706cc299efaacef853dd564b2e52e727b55e103f1d7'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

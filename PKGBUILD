# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-unicode
pkgver=0.25.2.1
pkgrel=1
pkgdesc='Hare unicode database' 
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-wayland'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('bd0b01d2e7c582f526b7ae940caf0cc82f82b36e5cc40a91bde7ce09a94a786e610c6c0e0856648504d6afe1c37df38151280cd130c06ee4985cd9d5c9d3189b')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

pkgname=mkinitcpio-nbd
pkgver=0.4.2
pkgrel=1
pkgdesc='mkinitcpio hook to boot from a Network Block Device (NBD)'
arch=('any')
url='https://github.com/mus65/mkinitcpio-nbd'
license=('BSD')
depends=('mkinitcpio' 'mkinitcpio-nfs-utils' 'nbd')
source=("https://github.com/mus65/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8414588fe22c33f4f3602951e98311c11ba425c20c9be4833d8fb6a3c0add8af')

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

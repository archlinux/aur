pkgname=mkinitcpio-nbd
pkgver=0.4.2
pkgrel=1
pkgdesc='mkinitcpio hook to boot from a Network Block Device (NBD)'
arch=('any')
url='https://github.com/mus65/mkinitcpio-nbd'
license=('BSD')
depends=('mkinitcpio' 'mkinitcpio-nfs-utils' 'nbd')
source=("https://github.com/mus65/$pkgname/archive/$pkgver.tar.gz")
md5sums=('ab1bc75a2f657cf3a42255b50472e10a')

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

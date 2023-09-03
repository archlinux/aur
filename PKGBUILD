pkgname=mkinitcpio-bond
pkgver=0.0.1
pkgrel=1
pkgdesc='mkinitcpio hook to configure network bonding'
arch=('any')
url='https://github.com/a13xie/mkinitcpio-bond'
license=('BSD')
depends=('mkinitcpio' 'mkinitcpio-nfs-utils')
source=("https://github.com/a13xie/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e8d79cd5b488759a1a4c895a189949549cbf053057597634273dcafa8b7900c7')

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

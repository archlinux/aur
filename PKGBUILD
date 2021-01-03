# Maintainer: Efe Çetin <efectn@6tel.net>
pkgname=mkinitcpio-live-boot
pkgver=1.0.0
pkgrel=1
pkgdesc="Live boot hooks for mkinitcpio."
arch=("x86_64")
url="https://gitlab.com/tearch-linux/tearch-live-hooks"
license=('GPL')
depends=("mkinitcpio")
source=("git+$url.git")
md5sums=(SKIP)

package() {
	cd tearch-live-hooks
	mkdir -p $pkgdir/lib/initcpio/hooks
	mkdir -p $pkgdir/lib/initcpio/install

	make install DESTDIR=$pkgdir
}

# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=(x86_64)
url="https://github.com/1995parham/gosimac"
license=('GPL2')

conflicts=('gosimac' 'gosimac-git')
provides=('gosimac')

source=("https://github.com/1995parham/gosimac/releases/download/v${pkgver}/gosimac_${pkgver}_linux_amd64.tar.gz")

sha256sums=('ee39be11fe160b321ee064a46896fd5fdbd073b3fe6c715a7352dfc0f168bb16')

package() {
	# package
	install -D -m755 $srcdir/gosimac $pkgdir/usr/bin/gosimac
}

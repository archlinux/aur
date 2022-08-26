# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac-bin
pkgver=5.5.1
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=(x86_64)
url="https://github.com/1995parham/gosimac"
license=('GPL2')

conflicts=('gosimac' 'gosimac-git')
provides=('gosimac')

source=("https://github.com/1995parham/gosimac/releases/download/v${pkgver}/gosimac_${pkgver}_linux_amd64.tar.gz")

sha256sums=('5bfe149daf8c5084abbd7bb864dae06e4770d114dc959cc393ee46611113c4a7')

package() {
	# package
	install -D -m755 $srcdir/gosimac $pkgdir/usr/bin/gosimac
}

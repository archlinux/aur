# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=(x86_64)
url="https://github.com/1995parham/gosimac"
license=('GPL2')

conflicts=('gosimac' 'gosimac-git')
provides=('gosimac')

source=("https://github.com/1995parham/gosimac/releases/download/v${pkgver}/gosimac_${pkgver}_linux_amd64.tar.gz")

sha256sums=('a8e399597f0058c434d068916a6f4849559aabe3e4a94f531950dbfd4e015374')

package() {
	# package
	install -D -m755 $srcdir/gosimac $pkgdir/usr/bin/gosimac
}

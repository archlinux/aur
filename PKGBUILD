# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=(x86_64)
url="https://github.com/1995parham/gosimac"
license=('GPL2')

conflicts=('gosimac' 'gosimac-git')
provides=('gosimac')

source=("https://github.com/1995parham/gosimac/releases/download/v${pkgver}/gosimac_${pkgver}_linux_amd64.tar.gz")

sha256sums=('79c6a15b7a113dcc8ce2d4ac65c701817cd4bca30ddc254570f4dd77142ced99')

package() {
	# package
	install -D -m755 $srcdir/gosimac $pkgdir/usr/bin/gosimac
}

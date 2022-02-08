# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pokemon-cursor
pkgver=1.0.0
_commit=022e28ce502256062864f7a3c50d0dd2806f82e8
pkgrel=1
pkgdesc='An unofficial opensource Pokemon cursor theme for Windows and Linux'
arch=(any)
url=https://github.com/ful1e5/pokemon-cursor
license=(GPL3)
depends=(libxcursor libx11 libpng)
makedepends=(nodejs yarn python python-pip)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	make unix
}

package() {
	cd "$pkgname"
	make root="$pkgdir/usr/share/icons" install
}

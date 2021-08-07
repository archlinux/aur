# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-y-ru
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc="Y-RU theme for Plank"
arch=('any')
url='https://github.com/kennyh7279/plank-themes'
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("git://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/y-ru
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/y-ru/
}

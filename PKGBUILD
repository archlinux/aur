# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-shade
pkgname=$_pkgname-git
pkgver=0.2
pkgrel=1
pkgdesc="Shade theme for Plank"
arch=('any')
url='https://github.com/kennyh7279/plank-themes'
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("$pkgname::git+https://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/shade
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/shade/
}

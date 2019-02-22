# Maintainer: JOHNeMac36 (johnemac36@gmail.com)

pkgname=pandwaita
pkgver=1.0
pkgrel=1
pkgdesc="Icon theme based on Adwaita but with 3 cute panda cursors."
url="https://github.com/JOHNeMac36/pandwaita"
arch=(any)
license=(GPL)
depends=()
makedepends=()
optdepends=('optipng' 'inkscape')
options=(!emptydirs)
source=("pandwaita-$pkgver.tar.gz"::"https://github.com/JOHNeMac36/pandwaita/archive/1.0.tar.gz")
sha256sums=('4e166c4ccbce6748fb7d5151490d714aa7c346cc4b8b03ad901ab6cde3fc1b7b')


package() {
	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir"

	mkdir -p $pkgdir/usr/share/icons/$pkgname
	cp -rT $srcdir/$pkgname-$pkgver/ "$pkgdir/usr/share/icons/$pkgname"
}

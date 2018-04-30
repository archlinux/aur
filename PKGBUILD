pkgname=x-arc-plus
pkgver=1.4.9
pkgrel=1
pkgdesc="X-Arc-Plus Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3' 'gtk-engine-murrine')
md5sums=('6a86b0c462dd90fb7f27a426495bd378')

source=("https://github.com/Jaxmetalmax/x-arc-themes/raw/master/X-Arc-Plus.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

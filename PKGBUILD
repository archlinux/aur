pkgname=x-arc-shadow
pkgver=1.4.9
pkgrel=1
pkgdesc="X-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3' 'gtk-engine-murrine')
md5sums=('d2f90ab1a2a88ce0c0380c0f7b529768')

source=("https://github.com/Jaxmetalmax/x-arc-themes/raw/master/X-Arc-Shadow.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

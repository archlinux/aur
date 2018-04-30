pkgname=x-arc-darker
pkgver=1.4.9
pkgrel=2
pkgdesc="X-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3' 'gtk-engine-murrine')
md5sums=('827b6696a9314cf774b46170b6bd822d')

source=("https://github.com/Jaxmetalmax/x-arc-themes/raw/master/X-Arc-Darker.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

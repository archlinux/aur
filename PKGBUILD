pkgname=x-arc-white
pkgver=1.4.9
pkgrel=1
pkgdesc="X-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3' 'gtk-engine-murrine')
md5sums=('4de2cd7057ad52a8e2785f31b1bd52e3')

source=("https://github.com/Jaxmetalmax/x-arc-themes/raw/master/X-Arc-White.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

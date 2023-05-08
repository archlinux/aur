# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='GTK theme for the Budgie and Cinnamon desktops'
pkgname=marwaita-gtk-theme
pkgver=17
pkgrel=1
url=https://github.com/darkomarko42/Marwaita
arch=(any)
license=(GPL3)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=(fa8d10086e2637d7a77cb12f427ea6ddded69e692caf23486f356889c74de8fd05406ace19ab66db5089c5f03d16ac4ea3baec1079e84b377c58d6aae76c9ca9)

build () {
	msg2 'Nothing to build'
}

package () {
	cd "Marwaita-$pkgver"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -pr 'Marwaita' 'Marwaita Dark' 'Marwaita Color' 'Marwaita Color Dark' 'Marwaita Alt' \
		"$pkgdir/usr/share/themes"
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='GTK theme for the Budgie and Cinnamon desktops'
pkgname=marwaita-gtk-theme
pkgver=20.3.1
pkgrel=1
url=https://github.com/darkomarko42/Marwaita
arch=(any)
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e4d5f78b288ff7d5daefbc0f4157976501a332f1faf371ff1e93b3147565e9b077c414c82e9393d5c0038404e9d1594f03766b194ff7901807b7f6c2da9f5a02')

build () {
	msg2 'Nothing to build'
}

package () {
	cd "Marwaita-$pkgver"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -pr Marwaita{,-s}{,-{Alt,Dark,Mix}} "$pkgdir/usr/share/themes"
}

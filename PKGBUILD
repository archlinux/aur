# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2023_10_20
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('75cb3b2861259c516c39d8cb401cb0d53fb475e649483851b41337585ecf6a47')
license=('GPL3')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2023_05_27
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('4e7b9511a6d816f65356e2f2493ef9764471662213cf80e7d9003420be9ed935')
license=('GPL3')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

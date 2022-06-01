# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2022_05_29
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('9a944957abf8c6d6f4b0fdf0c4df727a0566add10bb771199761a0d231874ec9')
license=('GPL3')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

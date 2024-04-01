# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2024_04_01
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('a03360526a85779a155fefa4b9ea871f4331d84e897583fb2f1d769ca46efb85')
license=('GPL3')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

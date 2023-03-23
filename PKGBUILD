# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2023_03_18
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('ff1d69b0614d2d4f9d03b5e3c388e0dc38f93f02b74d32330a8eaee5b4310848')
license=('GPL3')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

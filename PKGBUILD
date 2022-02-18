pkgname=orchis-theme
pkgver=2022_02_18
pkgrel=3
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('65ddf3ee5741f4c952a61fb7767c278ac5cba60d1b69f5ab179f07051031781c')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJof "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

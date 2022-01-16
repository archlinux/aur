pkgname=orchis-theme
pkgver=2021_12_13
pkgrel=2
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('1170c2b1ce3fcb17cc534205d7e4c93bf1c5a7ae9515bf9c40ee9b5e4a788de1')


package() {
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xJf "Orchis-theme-${pkgver//_/-}/release/Orchis.tar.xz" -C "$target"
}

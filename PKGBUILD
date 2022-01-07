# Maintainer: Andrea Denisse Gómez-Martínez <denisse at archlinux dot org>
# Contributor: Radu Bîrzu <radu@webative.net>

pkgname=dracula-gtk-theme
pkgver=v3.0
pkgrel=2
pkgdesc="Dark theme for GTK"
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/Dracula.tar.xz")
sha256sums=('d0a7af0baab7c2ec4ed138c7ee1e4558450154ee4b9a5545e7525d022a79d261')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "$srcdir/Dracula"

	mkdir -p "$pkgdir/usr/share/themes/Dracula"
	cp -a "$srcdir/Dracula/"* "$pkgdir/usr/share/themes/Dracula/"
}

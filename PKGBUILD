# Maintainer: denisse <denisse at archlinux dot org>
# Contributor: Radu Bîrzu <radu@webative.net>

pkgname=dracula-gtk-theme
pkgver=v4.0.0
pkgrel=1
pkgdesc="Dark theme for GTK"
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/Dracula.tar.xz")
sha256sums=('199bd4051b243fddadc625038686c7e8a91d4e8098868aadb4ca4c0c80911b6f')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "$srcdir/Dracula"

	mkdir -p "$pkgdir/usr/share/themes/Dracula"
	cp -a "$srcdir/Dracula/"* "$pkgdir/usr/share/themes/Dracula/"
}

# Maintainer: basigur

pkgname=avatar-theme-neru
pkgver=2.0
pkgrel=2
pkgdesc="Avatar icons Neru"
arch=('any')
url="https://github.com/chistota/avatar-theme-neru"
license=('custom')
depends=()
replaces=('avatar-theme-neru')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha256sums=('427ba2a9b4b0b979e285dd83c11f78a130ec83f85236a8a9bda3ba8a8ad784f2')

package() {
	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -d "$pkgdir/usr/share/pixmaps/faces"
	install -d "$pkgdir/usr/share/user-manager"
	cp -r {README.md,AUTHORS} "$pkgdir"/usr/share/doc/"${pkgname}"/
	cp -r 'avatar' "$pkgdir"/usr/share/user-manager/'avatars'
	cp -r faces/*.png "$pkgdir/usr/share/pixmaps/faces"

}
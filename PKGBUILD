# Maintainer: kitters_kat
# Contributor: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=12.6.0.1
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
url='https://codeberg.org/Arcticons/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ffcccbcb8fbfb96415f754b59688fc43bc3c2389b4afad2ae2efde51680919657321ecc757ae7a186ecee81d9cbb5f3daf3f02d6086fc684de1beea261831a4a')

package() {
	cd "$srcdir/Arcticons-Linux-$pkgver"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

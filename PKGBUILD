# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=9.6.5.0
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
url='https://github.com/Arcticons-Team/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9f310857d0698bd12e5cb44756b377d77d36c64b5864ec2a57de8d67e3c04e1a4a3b766fc89dabe1f6ab2526c5a1d8fb51f120f57f94d2b4fd4a3582e4cd0671')

package() {
	cd "$srcdir/Arcticons-Linux-$pkgver"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

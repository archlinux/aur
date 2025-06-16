# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=departure-mono
_pname=DepartureMono
pkgbase=$_fname-font
pkgname=(otf-$_fname)
pkgver=1.500
pkgrel=1
pkgdesc='a monospaced pixel font with a lo-fi technical vibe'
arch=(any)
url='https://departuremono.com'
license=(OFL)
provides=("$pkgbase")
_archive="$_pname-$pkgver"
source=("$url/assets/$_archive.zip")
sha256sums=('bf3e48059aeef4617ec585bdea81dcc3491c576b3e7a472f52faf40e09ee5c3a')

package_otf-departure-mono() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" $_pname-*.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

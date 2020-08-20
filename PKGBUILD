# Maintainer:jpe90 <patriot.game@gmail.com>
pkgname='ttf-permanent-marker'
pkgver=1.0.0
pkgrel=1
pkgdesc='handwritten-style font by Font Diner'
arch=(any)
url="https://fonts.google.com/specimen/Permanent+Marker"
license=(OFL)
source=("$pkgname.zip::https://fonts.google.com/download?family=Permanent+Marker")
sha256sums=('22ac9cb8e38f9c78e9a6bae39753c68bef3b65174a3980ccd4173d2a76690164')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" PermanentMarker-Regular.ttf
}

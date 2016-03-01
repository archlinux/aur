pkgname=ttf-bookerly
pkgver=4.21.0.65
pkgrel=1
pkgdesc="Amazon Kindle Fonts"
arch=(any)
url="https://play.google.com/store/apps/details?id=com.amazon.kindle"
license=('unknown')
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=("amazonkindle.apk::http://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=60658")
sha256sums=('462e9da7d6eb7cf67aa8abb6f66b522104fa1d7465a10f338ca488a187387490')

package() {
	cd "$srcdir/assets"

	# Prepare destination directory
	install -dm755 "$pkgdir/usr/share/fonts/TTF"

	# Install fonts
	install -m644 Bookerly*.ttf "$pkgdir/usr/share/fonts/TTF"
}

# Maintainer: Manthan <manthanmji@gmail.com>
pkgname="myuzi"
pkgver="v1.13.3"
pkgrel=1
pkgdesc="Spotify alternative with no ads, payments or accounts"
arch=("any")
url="https://gitlab.com/zehkira/myuzi"
license=("MIT")
depends=("gtk4" "libadwaita" "python-setuptools" "python-requests" "python-gobject" "python-beautifulsoup4" "python-pillow" "gst-libav" "gst-plugins-good" "yt-dlp")
makedepends=("nuitka")
source=("https://gitlab.com/zehkira/myuzi/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver/source"
	make prefix="$pkgdir/usr" install
}

# Maintainer: zehkira <(same as my name) at pm me>
pkgname="myuzi"
pkgver="v0.7.2"
pkgrel=2
pkgdesc="Spotify alternative with no ads, payments or accounts"
arch=("any")
url="https://gitlab.com/zehkira/myuzi"
license=("MIT")
depends=("python-setuptools" "python-requests" "python-gobject" "python-beautifulsoup4" "gst-libav" "gst-plugins-good" "yt-dlp")
source=("https://gitlab.com/zehkira/myuzi/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

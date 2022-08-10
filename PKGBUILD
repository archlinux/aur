# Maintainer: zehkira <KHNhbWUgYXMgbXkgbmFtZSkgYXQgcG0gbWU=>
pkgname="myuzi"
pkgver="v1.0.0"
pkgrel=1
pkgdesc="Spotify alternative with no ads, payments or accounts"
arch=("any")
url="https://gitlab.com/zehkira/myuzi"
license=("MIT")
depends=("gtk4" "python-setuptools" "python-requests" "python-gobject" "python-beautifulsoup4" "gst-libav" "gst-plugins-good" "yt-dlp")
source=("https://gitlab.com/zehkira/myuzi/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

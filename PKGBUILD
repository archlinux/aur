# Maintainer: zehkira <(same as my name) at pm me>
pkgname="myuzi"
pkgver="v0.1.4"
pkgrel=2
pkgdesc="Spotify alternative with no ads, payments or accounts"
arch=("any")
url="https://gitlab.com/zehkira/myuzi"
license=("MIT")
depends=("python-gobject" "youtube-dl" "gst-libav" "python-beautifulsoup4")
source=("https://gitlab.com/zehkira/myuzi/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: zehkira <KHNhbWUgYXMgbXkgbmFtZSkgYXQgcG0gbWU=>
pkgname="myuzi"
pkgver="v1.9.0"
pkgrel=1
pkgdesc="Spotify alternative with no ads, payments or accounts"
arch=("any")
url="https://gitlab.com/zehkira/myuzi"
license=("MIT")
depends=("gtk4" "libadwaita" "python-setuptools" "python-requests" "python-gobject" "python-beautifulsoup4" "python-pillow" "gst-libav" "gst-plugins-good" "yt-dlp")
source=("https://gitlab.com/zehkira/myuzi/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver/source"
	python setup.py install --root="$pkgdir" --optimize=1
	make prefix="$pkgdir/usr" install
}

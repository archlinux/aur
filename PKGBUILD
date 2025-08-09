# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=2.19
pkgrel=1
pkgdesc='A simple PYTHON script to convert Steam recordings to .mp4 files'
arch=(any)
url=https://github.com/Nastas95/SteamClip
license=(GPL-3.0-only)
depends=(
	python
	python-imageio-ffmpeg
	python-pillow
	python-pyqt5
	python-requests
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb2a2a4212e99403f581bda09fffc6b6eb8038e98ad0d2222c8f9bc9d4616bba')

package() {
	install -Dm755 "SteamClip-$pkgver/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}

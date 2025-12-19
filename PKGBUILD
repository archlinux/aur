# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=3.5
pkgrel=1
pkgdesc='A simple PYTHON script to convert Steam recordings to .mp4 files'
arch=(any)
url=https://github.com/Nastas95/SteamClip
license=(GPL-3.0-only)
depends=(
	python
	python-imageio-ffmpeg
	python-pathvalidate
	python-pillow
	python-pyqt6
	python-requests
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b7eb11cebb90594e98c743f4123deb59d3b7da67aeb3192e71c7ca3e60e4f16')

package() {
	install -Dm755 "SteamClip-${pkgver}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

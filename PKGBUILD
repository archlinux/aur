# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=4.0
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8ab055c8bd2f0c3ced15384b91080ef8c2de0b7f4b849b39e9eedc1679ad895')

package() {
	install -Dm755 "SteamClip-${pkgver}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

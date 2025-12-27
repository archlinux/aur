# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=3.5.1
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
sha256sums=('1162ccef32e12b53e547a9cce1c32e7cd5e30f8fbfa4ba979769a6dd470e4d6a')

package() {
	install -Dm755 "SteamClip-${pkgver}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

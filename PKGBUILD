# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=steamclip
pkgver=3.6
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
sha256sums=('2d55cdb81fed49493408f1d259c12fcc8e34b2acbd8fceedf5b211fa5959fe2f')

package() {
	install -Dm755 "SteamClip-${pkgver}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

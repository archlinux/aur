
pkgname="python-ffmpeg-pip"
pkgver=1
pkgrel=1
pkgdesc='Python bindings for FFmpeg - with complex filtering support. Pip version.'
arch=(any)
license=('Apache')
depends=(python)
makedepends=(python-pip)
provides=("python-ffmpeg")
conflicts=("python-ffmpeg")

package() {
	PIP_CONFIG_FILE=/dev/null pip3 install --isolated --root="$pkgdir" --ignore-installed --no-deps ffmpeg-python
}

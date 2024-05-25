# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Code Liger <codeliger@protonmail.com>

pkgname=video-compare
pkgver=20240525
pkgrel=1
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2"
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL-2.0-only')
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pixop/video-compare/archive/${pkgver}.tar.gz")
sha256sums=('7a8f559da1f069270495bfabe19cde4a0102187812afbd6885430d4a7b3bd9c2')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/${pkgname}"
}

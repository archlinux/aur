# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Code Liger <codeliger@protonmail.com>

pkgname=video-compare
pkgver=20260214
pkgrel=1
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2"
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL-2.0-only')
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pixop/video-compare/archive/${pkgver}.tar.gz")
sha256sums=('f7a9232c94814f4b796ed0ca88786cc6f9aa8c9e46d11ed9eea2ce1279e588c2')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/${pkgname}"
}

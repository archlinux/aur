# Maintainer: BrainDamage

pkgname=pico2wave-shell
pkgver=1
pkgrel=1
pkgdesc="Shell wrapper replacement for pico2wave, based on pico-tts and ffmpeg, that doesn't depend on binary/outdated sources"
arch=('any')
url=""
provides=('svox-pico' 'svox-pico-bin' "${pkgname%-shell}")
conflicts=('svox-pico' 'svox-pico-bin' "${pkgname%-shell}")
license=('MIT')
depends=('ffmpeg' 'pico-tts')
source=("${pkgname}")
sha256sums=('3b6a5e8da5a08f4950698292418b454f886ecbf42a4a0e35374163d73bffa645')

package() {
	install -Dvm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname%-shell}"
}

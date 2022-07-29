pkgname=play-in-mpv
pkgver=1.0.3
pkgrel=2
pkgdesc='Play Bilibili video in mpv player.'
url='https://github.com/diannaojiang/Bilibili-Playin-Mpv'
arch=('x86_64')
source=(
	"${url}/releases/download/v${pkgver}/Bilibili-Playin-Mpv.v1.0.Linux.x86_64.zip"
	"playinmpv.desktop"
)

package() {
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/playinmpv" "${pkgdir}/usr/bin/playinmpv"
	install -Dm644 "${srcdir}/playinmpv.desktop" "${pkgdir}/usr/share/applications/playinmpv.desktop"
}

sha256sums=('79eadc9c8c3076d487babd21ef74f087515dca9a94f675a75957b29ceff0ac59'
	'5a8e1888332c135219ac6bad9aa0f74042cd5f367191071818593a002bfb98e2')

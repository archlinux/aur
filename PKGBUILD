# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname=soundfont-sm64
pkgver=2
pkgrel=3
pkgdesc="Super Mario 64 soundfont for MIDI playback made by PablosCorner"
arch=(any)
url="https://www.smwcentral.net/?p=viewthread&t=88116"
makedepends=(megatools)
source=("SM64SF V${pkgver} by PablosCorner.zip::https://mega.nz/file/Ps5QlIJJ#g64hlLyzSOvOpZflRxK88Qk1voADXeOFl2pxBzYYU1U")
md5sums=(10c951d51c5af0dcd794c05bf6dd3c65)

DLAGENTS=("https::/usr/bin/megatools dl %u")

package() {
	cd "SM64SF by Pablo's Corner"

	install -Dm644 "SM64SF V2.sf2" "${pkgdir}/usr/share/soundfonts/SM64SF_V2.sf2"
	install -Dm644 readmefirst.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=inkscape-j-tech-photonics-laser-tool
pkgver=2.5.1
pkgrel=1
pkgdesc='Inkscape extension that generates gcode for laser cutters and plotting machines from SVG files'

url='https://github.com/JTechPhotonics/J-Tech-Photonics-Laser-Tool'
license=(MIT)
arch=(any)

depends=(
	inkscape
	#python-svg-to-gcode-git
)

source=("https://github.com/JTechPhotonics/J-Tech-Photonics-Laser-Tool/releases/download/v$pkgver/laser.zip")
sha256sums=('841b585a5bdc59b6c701a94e73b5f4a8b308cc2d266a8b01563189d93580b79f')

package() {
	find laser -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/inkscape/extensions/{}" \;
}

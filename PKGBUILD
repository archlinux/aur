# Maintainer: Denshi <alex@denshi.org>

pkgname=synthv-studio
pkgver=1
pkgrel=1
pkgdesc="Synthesizer V studio by Dreamtonics"
arch=("x86_64")
url=https://dreamtonics.com/synthesizerv
license=(custom)
depends=()
provides=("synthv-studio")
conflicts=("synthv-studio")
source=("https://resource.dreamtonics.com/download/Synthesizer%20V%20Studio%20Basic/latest/svstudio-basic-linux64-latest.zip"
	"synthv-studio.sh")
sha256sums=("SKIP"
	"SKIP")
	   

build() {
  chmod +x "${srcdir}/Synthesizer V Studio Basic/synthv-studio"
}

package() {
  install -d "${pkgdir}/opt/synthv-studio"
  cp -r "${srcdir}/Synthesizer V Studio Basic/." "${pkgdir}/opt/synthv-studio"

  install -Dm755 "${srcdir}/synthv-studio.sh" "${pkgdir}/usr/bin/synthv-studio"

}

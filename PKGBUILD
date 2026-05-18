# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=freepats-salamander-sf2
pkgver=20200602
pkgrel=1
pkgdesc="Yamaha C5 grand piano sf2 SoundFont"
arch=('any')
url="http://freepats.zenvoid.org/Piano/acoustic-grand-piano.html"
license=('CC-BY-3.0')
groups=('soundfonts')
source=("https://freepats.zenvoid.org/Piano/SalamanderGrandPiano/SalamanderGrandPiano-SF2-V3+${pkgver}.tar.xz")
sha256sums=('15edb061d7ba60d58332f72dba8f8ce40988048cc703f935e6320f37d650e213')

package() {
  install -Dm644 "${srcdir}/SalamanderGrandPiano-SF2-V3+${pkgver}/SalamanderGrandPiano-V3+${pkgver}.sf2" -t "${pkgdir}/usr/share/soundfonts"
  install -Dm644 "${srcdir}/SalamanderGrandPiano-SF2-V3+${pkgver}/readme.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

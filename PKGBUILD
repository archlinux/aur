# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=salamander_piano
pkgver=3
pkgrel=3
pkgdesc="A high-quality (48 kHz/24 bit/16 layers) piano sample library"
arch=("any")
url="http://freepats.zenvoid.org/Piano/"
license=("cc-by-3.0")
optdepends=("linuxsampler: for playing SFZ instruments")
source=("https://freepats.zenvoid.org/Piano/SalamanderGrandPiano/SalamanderGrandPiano-SFZ+FLAC-V3+20200602.tar.gz")
md5sums=('af98f81e18cef3058098076d09f336e0')
PKGEXT='.pkg.tar'

package() {
  cd "$srcdir"
  install -m755 -d "${pkgdir}/usr/share/sounds"
  mv SalamanderGrandPiano-SFZ+FLAC-V3+20200602 "${pkgdir}/usr/share/sounds"
}

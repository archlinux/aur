# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=salamander_piano
pkgver=3
pkgrel=1
pkgdesc="A high-quality (48 kHz/24 bit/16 layers) piano sample library"
arch=("any")
url="http://freepats.zenvoid.org/Piano/"
license=("cc-by-3.0")
optdepends=("linuxsampler-svn: for playing SFZ files")
source=("http://freepats.zenvoid.org/Piano/SalamanderGrandPianoV3_48khz24bit.tar.bz2")
md5sums=('44c5be2c774aeb968cf9bc09952511dd')
PKGEXT='.pkg.tar'

package() {
  cd "$srcdir"
  install -m755 -d "${pkgdir}/usr/share/sounds"
  mv SalamanderGrandPianoV3_48khz24bit "${pkgdir}/usr/share/sounds"
}

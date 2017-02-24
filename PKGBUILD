pkgname=luftikus
pkgver=20140826
_pkgver=2014-08-26
pkgrel=1
pkgdesc="distrho port of EQ plugin (LV2/VST). digital adaptation of an analog EQ with fixed half-octave bands and additional high frequency boost"
arch=('x86_64')
url="http://distrho.sourceforge.net"
depends=('freetype2' 'libxext')
license=('GPL')
source=("http://sourceforge.net/projects/distrho/files/"$_pkgver"/$pkgname-linux64bit.tar.xz")
md5sums=('ab8d9328a2ae8c4c6ec21128658aca44')

package() {
  mkdir -p "${pkgdir}/usr/lib/vst"
  cp */*.so "${pkgdir}/usr/lib/vst"
}

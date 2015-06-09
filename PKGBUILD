# Maintainer: attila589 <attila589 at gmail dot com>

pkgname=tal-plugins
pkgver=20111210
pkgrel=1
pkgdesc="Togu Audio Line VST plugins - NoiseMaker, Dub III, Filter, Filter II, Reverb, Reverb II, Reverb III, Vocoder II - ported and compiled for Linux"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net"
depends=('freetype2' 'libxext' 'gcc-libs')
license=('GPL')
source=(http://sourceforge.net/projects/distrho/files/Ports/TAL-Plugins/TAL-Plugins_LinuxVST-32bit_${pkgver}.7z)
md5sums=('9ff2c6e0003a3bf5f656d60574d570d5')
sha256sums=('43e7446edd8cbcc914ee77a308ff6323de0182603f512f91689774642c961841')
if [[ $CARCH == x86_64 ]]; then
  source=(http://sourceforge.net/projects/distrho/files/Ports/TAL-Plugins/TAL-Plugins_LinuxVST-64bit_${pkgver}.7z)
  md5sums=('35531f13a38dd84a2cf8538ab43a59cd')
  sha256sums=('4a838821b692f129b5baeaba12c048300d92d0be83f6702f374219c72231c940')
fi

package() {
  mkdir -p "${pkgdir}/usr/lib/vst"
  cp */*.so "${pkgdir}/usr/lib/vst"
}

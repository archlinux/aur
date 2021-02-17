# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-noisemaker-vst3
pkgver=4.6.2
pkgrel=1
pkgdesc="A Free Soft Synth By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
md5sums=('e6a1a740629123437ff18da93058ea21')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-NoiseMaker.vst3 ${pkgdir}/usr/lib/vst3/TAL-NoiseMaker.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so
}

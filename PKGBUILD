pkgbase=tal-noisemaker
pkgname=("${pkgbase}-bin")
pkgver=5.0.4
pkgrel=5
arch=('x86_64')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
pkgdesc="A Free Soft Synth By TAL Software"
url="https://tal-software.com/products/tal-noisemaker"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
md5sums=('e2ab5f4553642ceea796ce2895fd3c47')

package_tal-noisemaker-bin() { 
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-NoiseMaker.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-NoiseMaker.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so
}

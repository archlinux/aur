pkgbase=tal-noisemaker
pkgname=("${pkgbase}-bin")
pkgver=5.0.5
pkgrel=1
arch=('x86_64')
groups=('pro-audio' "clap-plugins" 'vst-plugins' 'vst3-plugins')
pkgdesc="A Free Soft Synth By TAL Software"
url="https://tal-software.com/products/tal-noisemaker"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
md5sums=('fcd80693cebd9a7804339e4c3eb59186')

package_tal-noisemaker-bin() { 
  ## VST2 Plugin
  install -Dm755 ${srcdir}/TAL-NoiseMaker/libTAL-NoiseMaker.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-NoiseMaker.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so

  ## CLAP Plugin
  install -Dm755 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.clap ${pkgdir}/usr/lib/clap/TAL-NoiseMaker.clap
}

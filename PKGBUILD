pkgbase=tal-reverb4
pkgname=("${pkgbase}-bin")
pkgver=4.0.3
pkgrel=2
arch=('x86_64')
groups=('pro-audio' 'clap-plugins' 'vst-plugins' 'vst3-plugins')
pkgdesc="A Simple Algorithmic Reverb V4 By TAL Software"
url="https://tal-software.com/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('180ea564293a99cdb5841b63264ade98')

package_tal-reverb4-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-4/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-4.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so

  ## Install CLAP Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.clap ${pkgdir}/usr/lib/clap/TAL-Reverb-4.clap
}

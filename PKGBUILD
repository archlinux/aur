pkgbase=tal-vocoder
pkgname=("${pkgbase}-bin")
pkgver=2.2.1
pkgrel=1
arch=('x86_64')
groups=('pro-audio' 'clap-plugins' 'vst-plugins' 'vst3-plugins')
pkgdesc="A Phase Vocoder By TAL Software"
url="https://tal-software.com/products/tal-vocoder"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
md5sums=('e91cb165b3866a47714361eaa29ceded')

package_tal-vocoder-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/TAL-Vocoder-2/libTAL-Vocoder-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Vocoder-2.so
  
  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so

  ## CLAP Plugin
  install -Dm755 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.clap ${pkgdir}/usr/lib/clap/TAL-Vocoder-2.clap
}

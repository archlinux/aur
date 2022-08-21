pkgbase=tal-vocoder
pkgname=("${pkgbase}-bin")
pkgver=2.2.0
pkgrel=5
arch=('x86_64')
groups=('pro-audio''vst-plugins' 'vst3-plugins')
pkgdesc="A Phase Vocoder By TAL Software"
url="https://tal-software.com/products/tal-vocoder"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
md5sums=('ad70ad7a038e4adc57e12f3bf03cb5d8')

package_tal-vocoder-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Vocoder-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Vocoder-2.so
  
  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so
}

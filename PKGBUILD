pkgbase=tal-reverb3
pkgname=("${pkgbase}-bin")
pkgver=2.3.0
pkgrel=5
arch=('x86_64')
groups=('pro-audio''vst-plugins' 'vst3-plugins')
pkgdesc="A Simple Algorithmic Reverb V3 By TAL Software"
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-3_64_linux.zip')
md5sums=('fc584bf672bd98ed07226a86b7aef303')

package_tal-reverb3-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Reverb-3.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-3.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so
}

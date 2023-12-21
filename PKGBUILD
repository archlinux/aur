pkgbase=tal-reverb3
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.3.0
pkgrel=6
arch=('x86_64')
groups=('pro-audio')
pkgdesc="A Simple Algorithmic Reverb V3 By TAL Software"
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-3_64_linux.zip')
md5sums=('fc584bf672bd98ed07226a86b7aef303')

package_tal-reverb3-vst-bin() {
  ## VST2 Plugin
  groups=("vst-plugins")
  replaces=("tal-reverb3-bin")
  conflicts=("tal-reverb3-bin")
  provides=("tal-reverb3-vst-bin")
  install -Dm755 ${srcdir}/libTAL-Reverb-3.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-3.so
}

package_tal-reverb3-vst3-bin() {
  ## VST3 Plugin
  groups=("vst3-plugins")
  replaces=("tal-reverb3-bin")
  conflicts=("tal-reverb3-bin")
  provides=("tal-reverb3-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so
}

pkgbase=tal-reverb2
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.3.0
pkgrel=6
arch=('x86_64')
groups=('pro-audio')
pkgdesc="A Simple Algorithmic Reverb V2 By TAL Software"
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-2_64_linux.zip')
md5sums=('accb9049e6edfc1276ccfacbccdd9e4b')

package_tal-reverb2-vst-bin() {
  ## VST2 Plugin
  groups=("vst-plugins")
  replaces=("tal-reverb2-bin")
  conflicts=("tal-reverb2-bin")
  provides=("tal-reverb2-vst-bin")
  install -Dm755 ${srcdir}/libTAL-Reverb-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-2.so
}

package_tal-reverb2-vst3-bin() {
  ## VST3 Plugin
  groups=("vst3-plugins")
  replaces=("tal-reverb2-bin")
  conflicts=("tal-reverb2-bin")
  provides=("tal-reverb2-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so
}

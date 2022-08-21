pkgbase=tal-chorus-lx
pkgname=("${pkgbase}-bin")
pkgver=1.6.1
pkgrel=1
arch=('x86_64')
pkgdesc="A Simple Algorithmic Chorus By TAL Software"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
url="https://tal-software.com/products/tal-chorus-lx"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
sha256sums=('0a4abfe2d59b0f9d1932db77f9cc86f5e7281f083042e4a4fd23a0b42cf0fbc1')

package_tal-chorus-lx-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Chorus-LX.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}

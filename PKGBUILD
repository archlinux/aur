pkgbase=tal-reverb2
pkgname=("${pkgbase}-bin")
pkgver=2.3.0
pkgrel=5
arch=('x86_64')
groups=('pro-audio''vst-plugins' 'vst3-plugins')
pkgdesc="A Simple Algorithmic Reverb V2 By TAL Software"
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-2_64_linux.zip')
md5sums=('accb9049e6edfc1276ccfacbccdd9e4b')

package_tal-reverb2-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Reverb-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-2.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so
}

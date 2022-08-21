pkgbase=tal-reverb4
pkgname=("${pkgbase}-bin")
pkgver=3.0.1
pkgrel=1
arch=('x86_64')
groups=('pro-audio''vst-plugins' 'vst3-plugins')
pkgdesc="A Simple Algorithmic Reverb V4 By TAL Software"
url="https://tal-software.com/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('41b2e5eb4c0ccc76cc25460f74847095')

package_tal-reverb4-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-4.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}

pkgbase=tal-chorus-lx
pkgname=("${pkgbase}-bin")
pkgver=1.6.2
pkgrel=1
arch=('x86_64')
pkgdesc="A Simple Algorithmic Chorus By TAL Software"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
url="https://tal-software.com/products/tal-chorus-lx"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
sha256sums=('41a84f69fd0db3672c32193cc8c883d41c11671a358a4ad423ecf5f2347a5c80')

package_tal-chorus-lx-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/TAL-Chorus-LX/libTAL-Chorus-LX.so ${pkgdir}/TAL-Chorus-LX/usr/lib/vst/TAL\ Software/libTAL-Chorus-LX.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so

  ## CLAP Plugin
  install -Dm755 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.clap ${pkgdir}/usr/lib/clap/TAL-Chorus-LX.clap
}

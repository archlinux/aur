pkgbase=tal-reverb2
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.3.0
pkgrel=3
arch=('x86_64')
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-2_64_linux.zip')
md5sums=('accb9049e6edfc1276ccfacbccdd9e4b')

package_tal-reverb2-vst() {
  groups=('pro-audio''vst-plugins')
  conflicts=("distrho-ports")
  replaces=("distrho-ports")
  pkgdesc="A Simple Algorithmic Reverb V2 By TAL Software (VST)"
  mkdir -p $pkgdir/usr/lib/vst
  cp -r ${srcdir}/libTAL-Reverb-2.so ${pkgdir}/usr/lib/vst/TAL-Reverb-2.so
  chmod +x ${pkgdir}/usr/lib/vst/TAL-Reverb-2.so
}

package_tal-reverb2-vst3() {
  groups=('pro-audio' 'vst3-plugins')
  pkgdesc="A Simple Algorithmic Reverb V2 By TAL Software (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Reverb-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so
}

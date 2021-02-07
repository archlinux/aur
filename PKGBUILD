# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-reverb2-vst3
pkgver=2.3.0
pkgrel=1
pkgdesc="A Simple Algorithmic Reverb By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-2_64_linux.zip')
md5sums=('accb9049e6edfc1276ccfacbccdd9e4b')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Reverb-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-2.vst3/Contents/x86_64-linux/TAL-Reverb-2.so
}

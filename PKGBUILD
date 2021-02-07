# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-reverb4
pkgver=2.3.0
pkgrel=1
pkgdesc="A Simple Algorithmic Reverb By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('aaac8dfd891774a80ab1334f928a2753')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  install -Dm755 ${srcdir}/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL-Reverb-4.so
  cp -r ${srcdir}/TAL-Reverb-4.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}

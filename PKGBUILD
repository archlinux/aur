# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-reverb3-vst3
pkgver=2.3.0
pkgrel=1
pkgdesc="A Simple Algorithmic Reverb By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-3_64_linux.zip')
md5sums=('fc584bf672bd98ed07226a86b7aef303')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Reverb-3.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-3.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so
}

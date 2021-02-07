# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-chorus-lx
pkgver=2.3.0
pkgrel=1
pkgdesc="A Simple Algorithmic Chorus By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
md5sums=('1717db55feddb28dde60e4b79c641dbc')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  install -Dm755 ${srcdir}/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL-Chorus-LX.so
  cp -r ${srcdir}/TAL-Chorus-LX.vst3 ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}

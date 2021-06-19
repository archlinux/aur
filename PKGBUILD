pkgname=tal-chorus-lx
pkgver=1.6.0
pkgrel=1
pkgdesc="A Simple Algorithmic Chorus By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
md5sums=('df5e26e04676c8b70fdbc4aa61fd6281')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  install -Dm755 ${srcdir}/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL-Chorus-LX.so
  cp -r ${srcdir}/TAL-Chorus-LX.vst3 ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}

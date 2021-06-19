pkgname=tal-reverb4
pkgver=2.4.0
pkgrel=1
pkgdesc="A Simple Algorithmic Reverb By TAL Software."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('5da6f0cc5b42d7a5d5f7523c16cbd40c')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  install -Dm755 ${srcdir}/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL-Reverb-4.so
  cp -r ${srcdir}/TAL-Reverb-4.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}

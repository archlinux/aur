# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-vocoder-vst3
pkgver=2.2.0
pkgrel=1
pkgdesc="A Phase Vocoder By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
md5sums=('ad70ad7a038e4adc57e12f3bf03cb5d8')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Vocoder-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Vocoder-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so
}

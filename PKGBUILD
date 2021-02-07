# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-filter2-vst3
pkgver=2.6.0
pkgrel=1
pkgdesc="A Filter By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
md5sums=('175a62684e753eba0a51ec90d00e1f4c')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Filter-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}

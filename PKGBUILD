# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=tal-filter-vst3
pkgver=2.6.0
pkgrel=1
pkgdesc="A Filter By TAL Software (VST3)."
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
source=('https://tal-software.com/downloads/plugins/TAL-Filter_64_linux.zip')
md5sums=('5239a5518007008755ced72c4e83510c')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Filter.vst3 ${pkgdir}/usr/lib/vst3/TAL-Filter.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Filter.vst3/Contents/x86_64-linux/TAL-Filter.so
}

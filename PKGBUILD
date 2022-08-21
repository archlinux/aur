pkgbase=tal-filter2
pkgname=("${pkgbase}-bin")
pkgver=3.1.0
pkgrel=5
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
pkgdesc="A Filter By TAL Software V2"
arch=('x86_64')
url="https://tal-software.com/products/tal-filter"
license=('EULA')
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
md5sums=('b1285c7075d468a04f8f8803cceaaa22')

package_tal-filter2-bin() {
  ## VST2 Plugin
  install -Dm755 ${srcdir}/libTAL-Filter-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Filter-2.so

  ## VST3 Plugin
  install -Dm755 ${srcdir}/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}

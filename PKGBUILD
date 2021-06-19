pkgname=tal-filter-vst3
pkgver=3.0.1
pkgrel=1
pkgdesc="A Filter By TAL Software (VST3)"
arch=('x86_64')
url="https://tal-software.com"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
groups=('multimedia')
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
md5sums=('f69785a7eb9d1da31807621456f04ea2')

package() {
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Filter-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}

pkgname="glitch2"
pkgdesc="An Audio Effects Plugin."
groups=('pro-audio' 'vst-plugins')
pkgver=2.1.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://illformed.com/glitch"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://illformed.com/downloads/glitch_2_1_3/demo/Glitch_2_1_3_Linux_Demo.zip')
md5sums=('c37418bde8a51b38b916e5147b2ae315')

package() {
  mkdir -p $pkgdir/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_64bit ${pkgdir}/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_32bit ${pkgdir}/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_Presets ${pkgdir}/usr/lib/vst
}

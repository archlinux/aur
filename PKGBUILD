pkgname="glitch2"
pkgdesc="An Audio Effects Plugin."
groups=('pro-audio' 'vst-plugins')
pkgver=2.1.2
pkgrel=1
arch=('x86_64' 'i686')
url="https://illformed.com/glitch"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://illformed.com/downloads/glitch_2_1_2/demo/Glitch_2_1_2_Linux_Demo.zip')
md5sums=('1e8b266d66956246116e818af9885414')

package() {
  mkdir -p $pkgdir/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_64bit ${pkgdir}/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_32bit ${pkgdir}/usr/lib/vst
  cp -rv "${srcdir}"/Glitch2_Presets ${pkgdir}/usr/lib/vst
}

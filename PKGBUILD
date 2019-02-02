# Maintainer: Tyler Long <dev@longfam.org>
pkgname=otf-sf-mono
pkgver=1.0
pkgrel=1
pkgdesc='The monospaced version of Apple San Francisco font'
arch=('any')
license=('custom')
url='https://developer.apple.com/fonts/'
depends=('fontconfig' 'xorg-font-utils')
source=("https://s3.amazonaws.com/aws.aur.wafflefrisbee/otf-sf-mono/SFMono.tar.xz")
md5sums=('d570cda292256cfc7d4e25078b6a3d23')
install=${pkgname}.install

package() {
  cd "$srcdir/SFMono"
  
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -m644 ${srcdir}/SFMono/*.otf ${pkgdir}/usr/share/fonts/OTF/

}

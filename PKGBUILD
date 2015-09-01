# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ni-visa
pkgver=15.0.0
pkgrel=1
pkgdesc="National Instruments NI-VISA(TM) Software for Linux"
url="http://www.ni.com/download/ni-visa-5.4.1/4629/en/"
#arch=('i686' 'x86_64')
arch=('x86_64')
license=('custom')
makedepends=('rpmextract')
depends=('')

source=("http://download.ni.com/support/softlib/visa/NI-VISA/15.0/Linux/NI-VISA-${pkgver}.iso")
md5sums=('c1dbdfd1f32d3d995b2a75e35e3a81ac')

package() {
  tar -xvf nivisa-15.0.0f1.tar.gz
  cd rpms
  rpmextract.sh nivisa-15.0.0-f0.x86_64.rpm

  mv "${srcdir}/rpms/usr" "${pkgdir}"
  
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

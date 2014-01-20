# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=lpc21isp
pkgver=1.97
pkgrel=1
pkgdesc="In-circuit programming (ISP) tool for the NXP (Philips) LPC1300 / LPC1700 / LPC2000 series ARM7 / M0 / M3 microcontrollers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lpc21isp/"
license=('LGPLv3')
depends=()
makedepends=()
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}_${pkgver/./}.tar.gz)
md5sums=('0b286859a05a725647ecb1b3fe9ba606')

build() {
  cd "$srcdir/${pkgname}_${pkgver/./}"

  make
}

package() {
  cd "$srcdir/${pkgname}_${pkgver/./}"
  
  install -d "$pkgdir/usr/bin"
  install -m755 lpc21isp "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

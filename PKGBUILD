# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Dan Serban
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=remobo
pkgver=0.72.1
pkgrel=4
pkgdesc="A zero-configuration IPN service"
arch=(i686 x86_64)
url='http://www.remobo.com/'
license=('custom')
depends=('gtk2' 'libjpeg6' 'libpng12')
source=("remobo.desktop")
md5sums=('ae8fd04338b0f569c3e21cfad8e1f7ce')

source_i686=("http://download.remobo.com/${pkgname}-${pkgver}.i686.tar.bz2")
md5sums_i686=('6e3810f6eb547a016f71494c8b623a3d')
source_x86_64=("http://download.remobo.com/${pkgname}-${pkgver}.x86_64.tar.bz2")
md5sums_x86_64=('2c76a6f219d6071d64988cb313a09aa3')

package() {
  mv "${srcdir}/${pkgname}-${pkgver}.${CARCH}/" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/remobo.desktop" \
    "${pkgdir}/usr/share/applications/remobo.desktop"
  cd "${pkgdir}/usr/libexec"
  chmod u+s *
}

# vim:set ts=2 sw=2 et:

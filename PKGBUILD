#
# PKGBUILD: vlink
#
# Maintainer: DYSEQTA <_dyseqta_-at-_me_-dot-_com_>
#

pkgname=vlink
pkgver=0.16f
_pkgver="0_16f"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('x86_64')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz)
sha256sums=('915bd7c569f41c153b1a3208f556c743dba4319c39c8b858554cb6bc24306626')

prepare()
{
  cd ${srcdir}/${pkgname}
}

build()
{
  cd ${srcdir}/${pkgname}
  make
}

package()
{
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  cp vlink ${pkgdir}/usr/bin
}

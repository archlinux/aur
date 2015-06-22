# Maintainer: 

pkgname=ddrescueview-bin
_pkgname=ddrescueview
pkgver=0.3
pkgrel=1
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('unzip')

case ${CARCH} in
  i686)
    _bldarch='i386'
    sha1sums=('c46ce32492105be4740e6173dbb2592eead1f32c')
    ;;
  x86_64)
    _bldarch='x86_64'
    sha1sums=('f8edc6b6cfe2828d7e0832a6b3d54985d6ea7a19')
    ;;
esac

source=(http://downloads.sourceforge.net/project/${_pkgname}/Releases/v${pkgver}/Linux-${_bldarch}/${_pkgname}-linux-${_bldarch}-${pkgver}.zip)

package() {
  
  install -D -m 755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  
}

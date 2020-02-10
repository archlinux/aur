# Maintainer: 

pkgname=ddrescueview-bin
_pkgname=ddrescueview
pkgver=0.4~alpha3
_pkgverurl=0.4%20alpha%203
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
    sha512sums=('f1b46e67a5f95e9c18b671f2b28573799361a082987d31dd18b8cd0c57ab7ef08da5727381a4335a8198f7922f7d93bf03f98c0a2f3ec579c8b992c69ac66800')
    ;;
  x86_64)
    _bldarch='x86_64'
    sha512sums=('42d2d18ec0a0d46bd4e0da1c0bb0ac3466c8351c5aad3b0b13232063029646abd013be131285e782a84117d61d78446683200ea3ca7f795b4e4e18e42fc44dd7')
    ;;
esac

source=(https://downloads.sourceforge.net/project/${_pkgname}/Test%20builds/v${_pkgverurl}/Linux-${_bldarch}/${_pkgname}-linux-${_bldarch}-${pkgver}.tar.xz)

package() {
  
  install -D -m 755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  
}

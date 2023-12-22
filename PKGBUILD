# Maintainer: bitwave
pkgname=pngthermal
pkgver=0.2a
pkgrel=2
pkgdesc="pseudo thermal view of PNG compression efficiency"
arch=('i686' 'x86_64')
url="http://encode.su/threads/1725-pngthermal-pseudo-thermal-view-of-PNG-compression-efficiency"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()

source=("http://encode.su/attachment.php?attachmentid=3260&d=1416178646")
sha256sums=('7479edcf7148bb6a571daca50dde6a69df752407eede1e2ecd01d64c9d42a142')

package() {
	cd "pngthermal_gnu-linux/"
  install -d $pkgdir/usr/bin
	[ "$CARCH" = "i686" ] && install -m755 pngthermal32 ${pkgdir}/usr/bin/${pkgname}
  [ "$CARCH" = "x86_64" ] && install -m755 pngthermal64 ${pkgdir}/usr/bin/${pkgname}
}

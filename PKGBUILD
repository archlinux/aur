# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=cdck-bin
pkgver=0.7.0
_debver=+dfsg-3
pkgrel=2
pkgdesc="Command-line tool for verifying the quality of a written CD or DVD"
arch=(x86_64 i686)
url="http://swaj.net/unix/index.html#cdck"
license=(GPL2)
depends=(gcc-libs)
optdepends=(gnuplot)
source_x86_64=("http://ftp.debian.org/debian/pool/main/c/cdck/cdck_${pkgver}${_debver}_amd64.deb")
source_i686=("http://ftp.debian.org/debian/pool/main/c/cdck/cdck_${pkgver}${_debver}_i386.deb")
sha256sums_x86_64=('451f6ed0bbfb090bd62c9421a0e64f833d376b731d11a12ef64a3a9100459f09')
sha256sums_i686=('0872f3bd912a9a03b1889f5773daead61ad8cd5b6c00dcee7ad04005534a7cbd')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

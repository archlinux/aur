# Maintainer: Michael Corrigan <ghost.vonage AT gmail DOT com>
# Upstream URL: https://duck.sh/

pkgname=duck
pkgver=4.7.17418
pkgrel=2
pkgdesc="Cyberduck CLI"
PKGEXT='.pkg.tar'
arch=('x86_64' 'i686')
license=('GPL')
options=(!strip)
url="https://duck.sh/"
install=$pkgname.install
makedepends=('rpmextract')
depends=()
md5sums_x86_64=('48fc1c17350adda930f8b4b1c3d16de0')
source_x86_64=("https://repo.cyberduck.io/stable/x86_64/duck-$pkgver.x86_64.rpm")
md5sums_i686=('fa217a087f45cc77292fa86f712f3b76')
source_i686=("https://repo.cyberduck.io/stable/i386/duck-$pkgver.i686.rpm")
package() {
  rpmextract.sh *
  chmod -R g-w opt
  mv opt "${pkgdir}"
}

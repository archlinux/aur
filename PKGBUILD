# Maintainer: Will R (will at digi-merc dot org)
# Contributors: 

pkgname=openstopmotion
pkgver=0.6.3
pkgrel=1
pkgdesc="OpenStopMotion Animation Capture"
arch=('x86_64')
url="https://www.pfp.de/osm/"
license=('GPL')
depends=('pcre' 'libtiff')
makedepends=('pacman>=4.2.0')
provides=("openstopmotion=$pkgver")
install="$pkgname.install"
source=("https://downloads.sourceforge.net/project/openstopmotion/Ubuntu%2012.04/OpenStopMotion-0.6.3-Ubuntu-12.04-amd64.deb")
sha256sums=('bfc614f76fede8ee4074b738682db4a22cf8754979f72baea2609cdd175dea37')

package() {
	bsdtar -xzf data.tar.gz -C "$pkgdir/"
  chmod -R 755 "$pkgdir/"
}
# vim:set ts=2 sw=2 et:

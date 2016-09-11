# Maintainer: Samantha McVey <samantham@posteo.net>
# This is derived from the Arch Linux community package connman.  Thanks to the contributors to
# that package are listed below:
#
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>
basepkgname=connman
pkgname=${basepkgname}-nmcompat
pkgver=1.33
pkgrel=2
pkgdesc="Transition package. Connman network manager with NetworkManager compatibility for all NetworkManager aware applications"
url="https://01.org/connman"
arch=('i686' 'x86_64')
license=('GPL2')
#provides=('connman')
depends=('connman')
source=("connman-nmcompat.install")
md5sums=('6b4e71ea46e1d65eea4f9c2185295d55')
package() {
	install=connman-nmcompat.install
}

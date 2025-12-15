# Maintainer: Jin Asanami <hayatehay.njb at gmail dot com>

pkgname="nako"
pkgver=1.0.1
pkgrel=2
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/nmimusic/nako"
license=('BSD-3-Clause')
depends=('sudo' 'pacman' 'jq' 'git' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5f3a60a76e8d3ee2b5f971a693789ba131199ee715296a062a510fd6402c9a66')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}

# Maintainer: Hayate NAKA-MURA <is01.njb at gmail dot com>

pkgname="nako"
pkgver=0.9.1
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/njb-fm/nako"
license=('BSD-3-Clause')
depends=('sudo' 'pacman' 'jq' 'git' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('bf303ee7da27febb8cd9dab6bbc0e2cc')
sha256sums=('887b2c2c6c15b6cf241a1e76b0de071ae54043bd559de19dbd3465bdaedf86ea')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}

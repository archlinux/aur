# Maintainer: Hayate NAKA-MURA <is01.njb at gmail dot com>

pkgname="nako"
pkgver=0.8.2.1
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/njb-fm/nako"
license=('BSD')
depends=('sudo' 'pacman' 'jq' 'git' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('528de63ef6cb8b76563e3fa7ec4230db')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}

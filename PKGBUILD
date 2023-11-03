# Maintainer: Hayate NAKA-MURA <is01.njb at gmail dot com>

pkgname="nako"
pkgver=0.9
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/njb-fm/nako"
license=('BSD-3-Clause')
depends=('sudo' 'pacman' 'jq' 'git' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('8f1f1283c0826cbb0d4d075e19cd5100')
sha256sums=('20845afce29c9b76aafec8c023e936f151e69d5f275eaba4b3b48d4ad66e5670')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}

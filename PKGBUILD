# Maintainer: Hayate NAKA-MURA <hayatehay.njb at gmail dot com>

pkgname="nako"
pkgver=1.0
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/njb-fm/nako"
license=('BSD-3-Clause')
depends=('sudo' 'pacman' 'jq' 'git' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('e1df9d807434c019e1a5ef4962a6a624')
sha256sums=('76958baef3bca98a52d22153e35fbe47a401aef0bd927eab97e86ba77b87f42b')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}

# Maintainer: Seppia <seppia@seppio.fish>
pkgname=repofish
pkgver=0.3
pkgrel=1
pkgdesc="My friends told me to make available this script I wrote to manage my local archlinux repo and AUR packages, so here it is."
arch=('any')
url="https://git.seppia.net/repofish.git"
license=('GPLv3')
groups=()
depends=('curl' 'git' 'jq')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://git.seppia.net/repofish.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f797fd06f8fbe71d3d392c882b3f49187fea6cdd618484945c7b0d38aaa27715')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D $pkgname $pkgdir/usr/bin/$pkgname
}

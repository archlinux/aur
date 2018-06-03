# Maintainer: Seppia <seppia@seppio.fish>
pkgname=repofish
pkgver=0.2
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
sha256sums=('844027e44fc43928637fff4e6609baacdbe01f6db8ed3761765fc544f04562f2')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D $pkgname $pkgdir/usr/bin/$pkgname
}

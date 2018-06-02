# Maintainer: Seppia <seppia@seppio.fish>
pkgname=repofish
pkgver=0.1
pkgrel=1
pkgdesc="My friends told me to make available this script I wrote to manage my local archlinux repo and AUR packages, so here it is."
arch=('any')
url="https://git.seppia.net/repofish.git"
license=('GPLv3')
groups=()
depends=('curl git jq')
provides=("${pkgname}")
conflicts=("${pkgname}","${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("https://git.seppia.net/repofish.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6043e48e168bf741c915ec5e9e870791e03b7021d54b6cb8c837c692d93f93c5')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D repo.sh $pkgdir/usr/bin/repofish
}

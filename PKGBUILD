# Maintainer: Seppia <seppia@seppio.fish>
pkgname=repofish
pkgver=0.3.1
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
sha256sums=('695a1e50fe04b7e58db60c101757621c5f699929a815fb5688fb461c90718105')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D $pkgname $pkgdir/usr/bin/$pkgname
}

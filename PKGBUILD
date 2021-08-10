# Maintainer: tywyqu <tywyqu at hi2 dot in>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
pkgname=papirus-claws-mail-theme-git
pkgver=20201019
pkgrel=1
pkgdesc="Papirus theme for claws mail"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-claws-mail-theme"
license=('GPL3')
makedepends=('git' 'librsvg')
_commit=3017a659a613489f110c2aa600496ac49c61da55
source=("git+${url}#commit=${_commit}")
md5sums=('SKIP')

build() {
	cd "${pkgname/-git/}"
	make build
}

package() {
	cd "${pkgname/-git/}"
	make DESTDIR="$pkgdir/" install
}

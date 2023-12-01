# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sizeof-go-bin
pkgver=1.0
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sizeof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sizeof)
conflicts=()
source=("https://codeberg.org/balaraz/sizeof/releases/download/v${pkgver}/sizeof-v${pkgver}-linux-amd64")
sha256sums=("4d337f49f2909c5bcd4484c482bba72fac26753a3b24c7161609e56ff403ec0c")

package() {
		cd $srcdir
		mv sizeof-v$pkgver-linux-amd64 sizeof
		install -Dm775 sizeof -t ${pkgdir}/usr/bin/
}

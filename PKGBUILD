# Maintainer: Stanisław Pitucha <viraptor@gmail.com>
pkgname="pvs-studio"
pkgver="6.10.19280.1.1"
pkgrel=1
epoch=
pkgdesc="Static Code Analyzer for C, C++ and C#"
arch=('x86_64')
url="http://www.viva64.com/en/pvs-studio/"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://files.viva64.com/$pkgname-${pkgver%.*}-${pkgver##*.}.x86_64.tgz")
noextract=()
md5sums=('5befc43afd49f9437800ff1e9b5f0db0')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/pvs-studio"
	tar -x -f $(basename "${source[0]}") -C "$pkgdir/usr/bin" plog-converter pvs-studio pvs-studio-analyzer
	tar -x -f $(basename "${source[0]}") -C "$pkgdir/usr/share/pvs-studio" README.md
}

# Maintainer: Andy Couturier <smoolak@gmail.com>

pkgname=dmenu-lpass-nu
pkgver=1.0
pkgrel=1
pkgdesc="dmenu script for lastpass-cli with account name and account user"
arch=("any")
url="https://smoolak.com/git/Smoolak/dmenu-lpass-nu"
license=("GPL3")
depends=("bash>=4" "lastpass-cli" "dmenu")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f063299eb456399c3ec7e39a626548d1e19ec4094b4260d8b9640523d35ea844')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$pkgname/dmenu-lpass.sh" "$pkgdir/usr/bin/dmenu-lpass-nu"
	chmod +x "$pkgdir/usr/bin/dmenu-lpass-nu"
}

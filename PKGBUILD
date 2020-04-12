# Maintainer: Ondrej Vlach <ondrej@vlach.xyz>

pkgname=wofipassmenu
pkgver=0.0.2
pkgrel=1
pkgdesc="Wofi based implementation of passmenu"
arch=('any')
url='https://github.com/ovlach/wofipassmenu'
license=('GPL2')
depends=(pass wofi bash wl-clipboard)
makedepends=()
provides=('wofipassmenu')
conflicts=('wofipassmenu')
source=("${pkgname}${pkgver}.tar.gz::https://github.com/ovlach/wofipassmenu/archive/v0.0.2.tar.gz")
md5sums=('41d084df6980d9af2a3414d69e35f69e')

package() {
	  cd "$srcdir"
	  install -Dm0755 "$srcdir/$pkgname-$pkgver/wofipassmenu" "$pkgdir/usr/bin/wofipassmenu"
}

# Maintainer: goetzc, napcok, jskier
pkgname=ubuntu-mate-themes
pkgver=17.04.1
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('849f402353097365f31dc707df57ea90d206832c64ae254102781fc07b4931a198624a11ac63c81c8d6620ef5eb9b6ab94565bcb87a87c6af0a3534e908fc13d')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

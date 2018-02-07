# Maintainer: goetzc, napcok, jskier
pkgname=ubuntu-mate-themes
pkgver=18.04.3
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('cb1dd1620fee9ca8f2e246cb3c55e62c2c7ba5c685c76f470fd9e0d973f614d029fc3bd0016b89111777e2a62c6bf2cc194e0c95f48f95a2a15d829694978189')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

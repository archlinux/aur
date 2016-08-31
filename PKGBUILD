# Maintainer: goetzc
pkgname=ubuntu-mate-themes
pkgver=16.04.6
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=('ubuntu-mate-icon-themes: Ubuntu Mate icon theme')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
md5sums=('2d18ed2e8b8bc6898c58b16d69fb06a7')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

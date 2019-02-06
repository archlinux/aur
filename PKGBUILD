# Maintainer: goetzc, napcok, jskier, archjo
pkgname=ubuntu-mate-themes
pkgver=18.10.1
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('4fb23583929822d1053629465d0813652940acee64b20dad2f9f32720ac9288f')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

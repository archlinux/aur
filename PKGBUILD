# Maintainer: goetzc, napcok, jskier, archjo
pkgname=ubuntu-mate-themes
pkgver=19.04.0
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('1baef9a3c4ac0e24cd32f6405aef4b0b631bab61009a4a5168f2fbc59bed997b')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

# Maintainer: goetzc, napcok, jskier, archjo
pkgname=ubuntu-mate-themes
pkgver=20.10.0
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('a951b30b30a635480bb9cf7988f10468fb1cfcd0f072cbfd57ebb2176f70b3fb')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

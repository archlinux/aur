# Maintainer: goetzc, napcok, jskier, archjo
pkgname=ubuntu-mate-themes
pkgver=20.04.2
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('449cd6819855efc3a9c38ac48d03db39643b2a90163852d3ef1935e664a5407b')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

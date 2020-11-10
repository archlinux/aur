# Maintainer: goetzc, napcok, jskier, archjo
pkgname=ubuntu-mate-themes
pkgver=20.10.1
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('947050c7c8f49aa84ddff1db11e5a97e547e9b3cd64c7ea46171d1724d0623f5')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

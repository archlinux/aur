# Maintainer: goetzc, napcok, jskier
pkgname=ubuntu-mate-themes
pkgver=18.04.11
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('123e55d99c92cc8b83b63d0adcd64ceedfb82879092d56b9e6f59a44dd3c8550')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

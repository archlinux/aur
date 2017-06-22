# Maintainer: goetzc, napcok, jskier
pkgname=ubuntu-mate-themes
pkgver=17.04.12
pkgrel=2
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('501f8ef8b6a8263b0157bf0fe0df37edd6dc86d526df980d0354c0a08c86d185873cfec2f2ff5f2890c7b614e6536ab7beb309550b239e0748265690cf3d0ec5')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

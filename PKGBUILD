# Maintainer: archjo
pkgname=ubuntu-mate-themes
pkgver=22.10.0
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('4d85a493504a458ccad7f0f15d08f35720995e5e4a664b8c22456b7900e4c207')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}

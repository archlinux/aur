# Maintainer: archjo
pkgname=ubuntu-mate-themes
pkgver=21.04.4
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('f381da56d2a21e8ec413e8cc7fb9778a2e6c8ee68982d33fdedb7efe6ddf15ab')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

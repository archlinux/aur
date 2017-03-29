# Maintainer: goetzc, napcok, jskier
pkgname=ubuntu-mate-themes
pkgver=17.04.8
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('5c78524c5c26afd2366820487790baeb29cdd2f2f8890b0286f6942af7a4a1ef289841932c179661e9de3273348b6a9ce46f3dbe754318decb11dcefd17e24e2')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}

# Maintainer: Maik93 <michael.mugnai@gmail.com>

pkgname=mender-cli
provides=('mender-cli')
conflicts=('mender-cli')
pkgdesc="Mender.io command line interface."
url="https://docs.mender.io/downloads#mender-cli"
pkgver=1.11.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
optdepends=()

source=("$pkgname::https://downloads.mender.io/mender-cli/$pkgver/linux/mender-cli")
md5sums=('d758109e606f5682e9b3af5f0827e565')

package() {
    install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=summercart64-bin
pkgver=2.20.2
pkgrel=1
pkgdesc="SummerCart64 deployer tool for the SummerCart64 N64 flashcart"
arch=('x86_64')
url="https://summercart64.dev/"
license=('GPL3')
depends=('glibc')
source=("sc64-deployer-linux-v${pkgver}.tar.gz::https://github.com/Polprzewodnikowy/SummerCart64/releases/download/v${pkgver}/sc64-deployer-linux-v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/sc64deployer" "${pkgdir}/usr/bin/sc64deployer"
}

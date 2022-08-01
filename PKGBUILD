# Maintainer: Markus Hartung <mail@hartmark.se>
_pkgname=catp
pkgname=catp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Print the output of a running process'
arch=('x86_64')
url="https://github.com/rapiz1/catp"
license=('GPL')
makedepends=('rust')
source=("v${pkgver}-${_pkgname}-${arch}-unknown-linux-gnu.zip::https://github.com/rapiz1/catp/releases/download/v${pkgver}/${_pkgname}-${arch}-unknown-linux-gnu.zip")
sha512sums=('a6ffa2e81f8732116c8bb8d92e26fe6e08f0184fc1eed42ab02f202fedca97e337996adf47bde488c65d2bb3139a4ac9efc487f5a0381bbe72dc9e58276ca148')
provides=("$_pkgname")

package() {
    install -Dm 755 -t "${pkgdir}/usr/bin" ./${_pkgname}
}

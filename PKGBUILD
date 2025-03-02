# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-common"
_pkgname="customfetch"
pkgver=1.0.0
pkgrel=1
pkgdesc="Common files for customfetch terminal and GUI app versions"
arch=('any')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
conflicts=('customfetch-common-git')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=("78810b20c622660de637b019f4b297d2c6370b0d5aa466dd3024216419a405af")

package() {
    rm -rf "${srcdir}/usr/bin"
    mv "${srcdir}/usr/" "${pkgdir}"
}

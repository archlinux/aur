# Maintainer: akiltixhaj1230 <https://github.com/akiltixhaj1230>
pkgname=my-little-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="An interactive post-install script for Arch Linux to easily select and batch-install gaming apps, launchers, and browsers."
arch=('any')
url="https://github.com/akiltixhaj1230/my-little-helper"
license=('GPL2')
depends=('bash' 'libnewt')
source=("${pkgname}-${pkgver}::https://raw.githubusercontent.com/akiltixhaj1230/my-little-helper/main/helper")
sha256sums=('c8a2dc74410ee08f201a139adfb05ded9bd210a0c219499f05906b5b9173403f')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/helper"
}

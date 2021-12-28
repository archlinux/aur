# Maintainer: Kiril Vladimiroff <kiril@vladimiroff.org>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=onlykey-udev
pkgver=0.1
pkgrel=1
pkgdesc="OnlyKey udev rules"
arch=('x86_64')
url="https://onlykey.io/"
license=('unknown')
source=("https://raw.githubusercontent.com/trustcrypto/trustcrypto.github.io/master/49-onlykey.rules")
sha256sums=('aa3398b13113c48a9214bdfe625e55317b06da8b1ce3d0c701e43470218949de')

package() {
  install -Dm 644 "${srcdir}/49-onlykey.rules" "${pkgdir}/usr/lib/udev/rules.d"
}

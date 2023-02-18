# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: David Thurstenson <thurstylark@gmail.com>
# Contributor: Kiril Vladimiroff <kiril@vladimiroff.org>

pkgname=onlykey-udev
pkgver=0.1
pkgrel=2
pkgdesc="OnlyKey udev rules"
arch=('x86_64')
url="https://onlykey.io/"
license=('unknown')
source=("https://raw.githubusercontent.com/trustcrypto/trustcrypto.github.io/b530e0e0a1d638a64c64376f36d0b7b0e80a8e38/49-onlykey.rules")
sha256sums=('aa3398b13113c48a9214bdfe625e55317b06da8b1ce3d0c701e43470218949de')

package() {
  install -Dm 644 "${srcdir}/49-onlykey.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
}

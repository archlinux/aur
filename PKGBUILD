# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
pkgname='truerng-udev'
pkgdesc='Udev rules for TrueRNG USB devices'
pkgver='1.0.0'
pkgrel='1'
_commit='263ccc91cf7465c79cb46c04d237ed26e2530641'
arch=('any')
url="https://github.com/euler357/TrueRNG"
#license=('unknown')
depends=('udev')
source=("${url}/raw/${_commit}/udev_rules/99-TrueRNG.rules")
b2sums=('72eb469e9797edc5d2ab35231656f377826adb5aa260d509f55cc03dd3bc8cf8d7ec1f3c7764f2e49d180bf1db65e0a3e8a9ee77a60c0e6d3d71d9b79ade0028')

package() {
  # Install rules
  install -Dm 0644 "${srcdir}/99-TrueRNG.rules" "${pkgdir}/etc/udev/rules.d/99-TrueRNG.rules"
}

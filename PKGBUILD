# Maintainer: LuckyTurtleDev  aur at lukas1818 dot de
pkgname=adafruit-boards-udev
pkgver=1
pkgrel=1
pkgdesc="udev rule for adafruit boards"
arch=('any')
url="https://github.com/jacobrosenthal/hf2-rs/tree/master/hf2-cli"
license=('Apache' 'MIT')
source=("file://99-adafruit-boards.rules")
md5sums=('29b232588bf2d3eed562199af73ce1e7')

package() {
  install -dm 755 "${pkgdir}/etc/udev/rules.d/"
  cp "${srcdir}"/*.rules "${pkgdir}/etc/udev/rules.d/"
}

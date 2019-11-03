# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Jan De Groot <jgc@archlinux.org>

pkgname=rpd-icons
pkgver=1
pkgrel=1
pkgdesc="Raspberry Pi icon theme"
arch=('any')
url="https://github.com/raspberrypi-ui/rpd-icons"
license=('GPL2')
source=("git+https://github.com/raspberrypi-ui/${pkgname}")
md5sums=('SKIP')

package() {
  install -dm 755 "${pkgdir}"/usr/share/icons/
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/
}


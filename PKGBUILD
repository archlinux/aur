# Maintainer: Adel Khial <adel.khial@gmail.com>

pkgname=unciv-bin
_pkgname=Unciv
pkgver=3.13.11.1
pkgrel=1
pkgdesc="Open-source remake of Civilization V"
url="https://github.com/yairm210/Unciv"
license=('MPL-2.0')
depends=('jre8-openjdk' 'bash' 'xorg-xrandr')
arch=('any')
source=(
  "https://github.com/yairm210/Unciv/releases/download/3.13.11-patch1/Unciv.jar"
  "$_pkgname.sh"
  "$_pkgname.desktop"
  "unciv.png::https://raw.githubusercontent.com/yairm210/Unciv/3.13.11-patch1/extraImages/Unciv%20icon%20v4.png"
)
md5sums=('e4efe45883990484be415035cc0dcd24'
         'f8eab098f20681b8db232cc5709713d3'
         '42d5f7ea8ee48d2d643d070786f039ba'
         '5aca7fc33f121fcf901fef14f784731a')

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 unciv.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}


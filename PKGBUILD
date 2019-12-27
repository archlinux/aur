# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
pkgname=ttf-literata
pkgver=2.201
pkgrel=1
pkgdesc="Google's default typeface for Play Books. Truetype, open source (OFL) distribution."
arch=('any')
url="https://github.com/googlefonts/literata"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-literata')
replaces=('otf-literata')
#source=("https://github.com/googlefonts/literata/releases/download/$pkgver/Literata-v$pkgver.zip")
source=("https://github.com/googlefonts/literata/releases/download/v$pkgver/Literata-v$pkgver.zip")
source+=("https://github.com/googlefonts/literata/raw/master/OFL.txt")
sha256sums=('b932af6bea23e1b62d2c524154001886ba3ddaafa7f81a88cb96277e2a452545'
            '8742963604cd89dc81437811a850018fc03b2bfad686d7422c8235967c87614e')

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/fonts/TTF/literata"
  install -dm755 "$pkgdir/usr/share/licences/$pkgname"

  install -m644 ttfs/Literata*.ttf "$pkgdir/usr/share/fonts/TTF/literata"
  install -m644 OFL.txt "$pkgdir/usr/share/licences/$pkgname"
}

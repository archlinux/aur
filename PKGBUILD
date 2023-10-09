# Maintainer:  inalone <me@inal.one>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ttf-perfectdos
pkgver=2
pkgrel=2
pkgdesc='Fonts similar to what BIOS/DOS looks like'
arch=('any')
license=('custom:free')
url='https://archive.org/details/LessPerfectDOSVGA'
depends=('fontconfig')
sha256sums=('0ec6f3179c60f41f296a0430c22318a211fbff026c8c8b678df835bb070fa329')
source=('https://archive.org/compress/LessPerfectDOSVGA/formats=TRUETYPE%20FONT&file=/LessPerfectDOSVGA.zip')

package() {
  cd "$srcdir"
  install -Dm644 'MorePerfectDOSVGA.ttf'      "$pkgdir/usr/share/fonts/TTF/MorePerfectDOSVGA.ttf"
  install -Dm644 'LessPerfectDOSVGA.ttf'  "$pkgdir/usr/share/fonts/TTF/LessPerfectDOSVGA.ttf"
}

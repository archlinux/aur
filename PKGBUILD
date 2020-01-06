# Maintainer: Žiga Leber <zigaleber7@gmail.com>
pkgname=ttf-pomicons
pkgver=1.0
pkgrel=1
pkgdesc='Font with symbols to talk about the "Pomodoro Technique"'
arch=('any')
url='https://github.com/gabrielelana/pomicons'
license=('CCPL')
depends=('fontconfig')
source=('https://github.com/gabrielelana/pomicons/raw/master/fonts/Pomicons.ttf')
sha256sums=('0c9fbff4598ea7bed6fa101093f8c43bebb9227d1c3a4c090293ea0b093cd905')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 Pomicons.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

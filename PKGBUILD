# Maintainer: kaixili <lkx810@gmail.com>
# Maintainer: jecxjo  <	jeff@commentedcode.org>

pkgname=ttf-press-start-2p
pkgver=1.0
pkgrel=1
pkgdesc="Press Start 2P Font"
arch=(any)
license=('OFL')
depends=(fontconfig xorg-font-utils)
url="https://www.dafont.com/press-start-2p.font"
source=("press_start_2p.zip::http://dl.dafont.com/dl/?f=press_start_2p")
sha256sums=('3658b093da5f6d7f3c44ff482b9fd1404e906793434e68ddc4299b7b08f6361d')
install=$pkgname.install

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/PressStart2P.ttf" "$pkgdir/usr/share/fonts/TTF/"
    install -d "$pkgdir/usr/share/licenses/ttf-press-start-2p"
    install -m644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/ttf-press-start-2p/LICENSE"
}

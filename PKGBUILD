pkgname=musescore-fonts
_pkgname=MuseScore
pkgver=2.0.3
pkgrel=1
pkgdesc="Fonts used by MuseScore notation software"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("musescore-${pkgver}.tar.gz::https://github.com/musescore/MuseScore/archive/v${pkgver}.tar.gz")
install=$pkgname.install
md5sums=('9f1a870302b27c25e8be729648af1c64')

package() {
  install -Dm644 ${_pkgname}-${pkgver}/fonts/mscore/mscore.ttf "$pkgdir"/usr/share/fonts/MScore/mscore.ttf
  install -Dm644 ${_pkgname}-${pkgver}/fonts/mscore/MScoreText.ttf "$pkgdir/usr/share/fonts/MScore Text/MScoreText.ttf"
  install -Dm644 ${_pkgname}-${pkgver}/fonts/mscore-BC.ttf "$pkgdir"/usr/share/fonts/MScoreBC/mscore-BC.ttf
  install -Dm644 ${_pkgname}-${pkgver}/fonts/mscoreTab.ttf "$pkgdir"/usr/share/fonts/MScoreTabulature/mscoreTab.ttf
  install -Dm644 ${_pkgname}-${pkgver}/fonts/MuseJazz-Mac.ttf "$pkgdir"/usr/share/fonts/MuseJazz/MuseJazz-Mac.ttf
  install -Dm644 ${_pkgname}-${pkgver}/fonts/MuseJazz.ttf "$pkgdir"/usr/share/fonts/MuseJazz/MuseJazz.ttf
}

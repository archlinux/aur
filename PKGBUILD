# Maintainer: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=ttf-ingleby
pkgver=1.0
pkgrel=1
pkgdesc="Ingleby font from dafont.com"
arch=('any')
url="http://www.dafont.com/ingleby.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=ingleby 'LICENSE')
md5sums=('efe53e9821d831bf7f41c94e582e9a86'
         '5f283b3761250226c5f1316d85cf0265')

build() {
  cd $srcdir
  install -Dm644 Ingleby_regular.ttf $pkgdir/usr/share/fonts/TTF/Ingleby_regular.ttf
  install -Dm644 Ingleby_italic.ttf $pkgdir/usr/share/fonts/TTF/Ingleby_italic.ttf
  install -Dm644 Ingleby_bold.ttf $pkgdir/usr/share/fonts/TTF/Ingleby_bold.ttf
  install -Dm644 Ingleby_bold_italic.ttf $pkgdir/usr/share/fonts/TTF/Ingleby_bold_italic.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/ttf-ingleby/LICENSE
}

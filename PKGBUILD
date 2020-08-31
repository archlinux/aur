# Maintainer: Andrey Zhidenkov <pensnarik@gmail.com>

pkgname=consolas-font
pkgver=1.2
pkgrel=2
pkgdesc="Consolas font"
arch=(any)
depends=(fontconfig xorg-font-util)
source=("https://github.com/pensnarik/$pkgname/raw/master/consolas-fonts-tts.tar.bz2")
install=$pkgname.install
md5sums=('728dfa03f8d86ef82a31d145b42a32c7')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}

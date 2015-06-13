# Maintainer: SanskritFritz (gmail)

pkgname=ttf-lacartoonerie
pkgver=2007.04.23
pkgrel=1
pkgdesc="Fancy cartoon style font created by laCartoonerie.com."
arch=('any')
url="http://www.lacartoonerie.com/"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
source=('http://img.dafont.com/dl/?f=lacartoonerie')
install=ttf.install

package() {
  install -Dm644 "${srcdir}/laCartoonerie.TTF" "${pkgdir}/usr/share/fonts/TTF/laCartoonerie.TTF"
}

md5sums=('f9088e1f2881edced5d4f3fbe8bb27f0')

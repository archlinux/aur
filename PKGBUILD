# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: longifn <longfinfunnel@gmail.com>

pkgname=spoqa-han-sans
pkgver=2.1.2
pkgrel=2
pkgdesc='TTF font for korean, english and japanese'
arch=('any')
url="http://www.spoqa-han-sans.com/"
license=('sil')
depends=('fontconfig' 'xorg-font-utils')
_fontgroup='SpoqaHanSans_original'
source=("https://github.com/spoqa/spoqa-han-sans/releases/download/v$pkgver/$_fontgroup.zip")
md5sums=('882bb716e0364a5e50a367ae59fde857')

package() {
  install -dm 755 ${pkgdir}/usr/share/fonts/TTF
  install -m 644 ${srcdir}/$_fontgroup/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

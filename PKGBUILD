# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: longifn <longfinfunnel@gmail.com>

pkgname=spoqa-han-sans
pkgver=3.2.1
pkgrel=1
pkgdesc='TTF font for korean, english and japanese'
arch=('any')
url="http://www.spoqa-han-sans.com/"
license=('sil')
makedepends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
_fontgroup='SpoqaHanSansNeo_TTF_original'
source=("https://github.com/spoqa/spoqa-han-sans/releases/download/v$pkgver/$_fontgroup.zip")
md5sums=('b3f3643558d29552d302941b671ba079')

package() {
  install -dm 755 ${pkgdir}/usr/share/fonts/TTF
  install -m 644 ${srcdir}/$_fontgroup/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

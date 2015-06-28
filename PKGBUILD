# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=04b_21
pkgver=1
pkgrel=2
pkgdesc="Symbol font from urbanfonts.com"
arch=('any')
url="http://www.urbanfonts.com/fonts/04b_21.htm"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("$pkgname.zip::http://www.urbanfonts.com/download.php?fid=8330&file=$pkgname.zip")
md5sums=('59fbc7f2dc53baa8b71034e8364ba910')

package() {
  cd "${srcdir}"

  install -Dm644 04B_21__.TTF "${pkgdir}"/usr/share/fonts/TTF/04B_21__.ttf
  install -Dm644 about.gif "${pkgdir}"/usr/share/licenses/$pkgname/license.gif
}

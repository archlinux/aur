# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=vim-colorscheme-sierra
pkgver=5.0.0
pkgrel=1
pkgdesc="A Vim colorscheme."
arch=('any')
url="https://github.com/AlessandroYorba/Sierra"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlessandroYorba/Sierra/archive/v${pkgver}.tar.gz"
        "LICENSE")
md5sums=('4482d221dbac21e3b6ea8feb572ebdb9'
         'b1649899e6ed82950e52f46a3e9656de')

package() {
  install -Dm755 "Sierra-${pkgver}/colors/sierra.vim" \
  "${pkgdir}/usr/share/vim/vimfiles/colors/sierra.vim"
  install -Dm755 "Sierra-${pkgver}/autoload/airline/themes/sierra.vim" \
  "${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/sierra.vim"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

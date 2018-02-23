# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=vim-colorscheme-alduin
pkgver=6.0.0
pkgrel=1
pkgdesc="A dark low-contrast Vim colorscheme for Terminal Vim and GUI Vim."
arch=('any')
url="https://github.com/AlessandroYorba/Alduin"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlessandroYorba/Alduin/archive/v${pkgver}.tar.gz"
        "LICENSE")
md5sums=('eed9003b5ff421a005e13215b847718b'
         'b1649899e6ed82950e52f46a3e9656de')

package() {
  install -Dm755 "Alduin-${pkgver}/colors/alduin.vim" \
	  "$pkgdir/usr/share/vim/vimfiles/colors/alduin.vim"
  install -Dm755 "Alduin-${pkgver}/autoload/airline/themes/alduin.vim" \
	  "${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/alduin.vim"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-unimpaired
pkgver=1.2
pkgrel=1
pkgdesc='pairs of handy bracket mappings'
arch=('any')
url='https://github.com/tpope/vim-unimpaired'
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tpope/vim-unimpaired/archive/v${pkgver}.tar.gz")
sha512sums=('842eeffa05f9dc753f31b8af393e5c38e5d59515384929095ec61a6223aa55c01c203bf6ed92c41c6c099cb82392ee2402404d1ebc2d5213963f94c9443dfce8')

package() {
  cd "${srcdir}/vim-unimpaired-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc}
  install -D -m644 plugin/unimpaired.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/unimpaired.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"
}

# vim:set et sw=2 ts=2 tw=79:

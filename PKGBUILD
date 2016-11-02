# Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=vim-commentary
pkgver=1.3
pkgrel=1
pkgdesc='Comment stuff out'
arch=('any')
url='https://github.com/tpope/vim-commentary'
groups=('vim-plugins')
depends=('vim>=7.0')
license=('custom:vim')
source=("https://github.com/tpope/vim-commentary/archive/v${pkgver}.tar.gz" 'LICENSE')
install='vimdoc.install'
md5sums=('814846695d5254a46118d574f33d9dbb' 'eea32ac1424bba14096736a494ae9045')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 doc/commentary.txt "${pkgdir}/usr/share/vim/vimfiles/doc/commentary.txt"
  install -Dm644 plugin/commentary.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/commentary.vim"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Dwayne Bent <dbb@dbb.io>

pkgname=vim-ferm
pkgver=0.10
pkgrel=1
pkgdesc='Vim syntax highlighting for ferm scripts'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4390'
license=('custom:vim')
depends=('vim-plugin-runtime')
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=27043")
sha256sums=('9c5810128eef739e22c7d01903676b845241396f0be9c775518580417a060bb9')

package() {
  cd "${srcdir}/ferm.vim-master"
  install -D -m644 ftdetect/ferm.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect/ferm.vim"
  install -D -m644 syntax/ferm.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/ferm.vim"
}


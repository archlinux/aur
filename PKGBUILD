# Maintainer: Eduardo Reveles <me at osiux dot ws>
pkgname=vim-codepad
pkgver=1.4
_scriptid=13438
pkgrel=1
pkgdesc="Post the contents of your current buffer to the pastebin service at codepad.org"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2298"
license=('custom')
depends=(gvim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('a08286132612828b01d5257d4a98cc3c'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
  cd "${srcdir}"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm0644 vim-codepad "$vimfiles/plugin/codepad.vim"
  install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
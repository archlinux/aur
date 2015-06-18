# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-hexman
pkgver=0.7.3
_scriptid=21365
pkgrel=1
pkgdesc="Simpler Hex viewing and editing"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=666"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        "license.txt")
sha256sums=('91150d156ae1c8c33e46dbb0d0c34c87d57dec795b12f33024495002505cfaad'
            '1b65169352a57daa6faa024201869c9929d321157e1a6f795b664a9c56f10f9f')

package() {
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/hexman.vim
  install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

# Maintainer: Daniel YC Lin <dlin.tw @ gmail com>
pkgname=vim-dirdiff
pkgver=1.1.5
_scriptid=22871
pkgrel=1
pkgdesc="A plugin to diff and merge two directories recursively"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=102"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(dirdiff.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('d5497543c0f1b1958d13b522cd384175')
package() {
    install -Dm644 ${srcdir}/plugin/dirdiff.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/dirdiff.vim
    install -Dm644 ${srcdir}/doc/dirdiff.txt    ${pkgdir}/usr/share/vim/vimfiles/doc/dirdiff.txt
    install -Dm644 ${srcdir}/doc/dirdiff.txt    ${pkgdir}/usr/share/licenses/${pkgname}/dirdiff.txt
}

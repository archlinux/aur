# Maintainer: Daniel YC Lin <dlin <at> gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-voom
pkgver=5.1
_scriptid=22082
pkgrel=1
pkgdesc="VOoM - Vim two-pane outliner. Support mediawiki,rest,markdown,..."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2657"
license=('CCPL')
depends=('vim-runtime' 'python2')
groups=('vim-plugins')
conflicts=('vim-voof')
replaces=('vim-voof')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

package() {
    install -d ${pkgdir}/usr/share/vim/vimfiles
    #rm ${pkgname}.zip
    cp -a VOoM-$pkgver/* ${pkgdir}/usr/share/vim/vimfiles
}
sha1sums=('676044c5ab32099961d8af4114616283a43dc4d7')

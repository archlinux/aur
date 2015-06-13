# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=vim-pep8
pkgver=0.3.1
pkgrel=2
_scriptid=14366
pkgdesc="A PEP 8 Python source file checker for Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2914"
license=('unknown')
depends=('vim' 'pep8')
groups=('vim-plugins')
source=(pep8.vim::"http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('393df8ac20d34f2ea8ec48420eac414e')

package() {
    cd "$srcdir"
    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -D -m644 pep8.vim \
    ${_installpath}/ftplugin/python/pep8.vim
}

# Maintainer: revel <revelΘmuub·net>

pkgname=vim-endwise
pkgver=1.2
_scriptid=21704
pkgrel=2
pkgdesc='Wisely add "end" in ruby, endfunction/endif/more in vim script, etc'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2386'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}.zip"::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('55130343b89e56d9c52c82921146f338')
sha256sums=('e896e765f6b207e00e7e28850483520816ccf47d5f7b26587be51ad312ececff')

package() {
    install -Dm644 "plugin/endwise.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/endwise.vim"
}

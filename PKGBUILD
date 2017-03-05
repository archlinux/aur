# Maintainer: revel <revelΘmuub·net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-colorsupport
pkgver=1.0.5
_scriptid=20938
pkgrel=3
pkgdesc='Use colorschemes written for gvim in color terminals'
arch=('any')
#url='http://www.vim.org/scripts/script.php?script_id=2682'
url='https://vim.sourceforge.io/scripts/script.php?script_id=2682'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
#source=("colorsupport.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
source=("colorsupport.vim::https://vim.sourceforge.io/scripts/download_script.php?src_id=${_scriptid}"
        'license.txt')
sha256sums=('a1f7db6f9ff21f2924ca025ecf195d3f09e24343572cbcea0300fba5dcd3c3a1'
            '5f96d0bf57942212b6117ac4e6eb9b6ad704c1758511333dd5785cedf3281b8d')

package() {
    cd "${srcdir}"

    local installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -D -m644 "colorsupport.vim" "${installpath}/plugin/colorsupport.vim"
    install -D -m644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

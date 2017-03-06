# Maintainer: Shengyu Zhang <lastavengers#archlinuxcn.org>

pkgname=vim-rest
pkgver=0.1
pkgrel=1
pkgdesc='A reStructuredText Syntax highlighting mode for vim'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=973'
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=('rest.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=2979')
sha256sums=('47e6377d4309e10881bd61d13905688a0681572b0c9f4dc1622fd333661e5e78')

package() {
    cd "${srcdir}"
    install -Dm644 rest.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/rest.vim"
}


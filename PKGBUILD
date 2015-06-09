# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-nerdcommenter
pkgver=2.3.0
_script_id=1218
_src_id=14455
pkgrel=3
pkgdesc='A plugin that allows for easy commenting of code for many filetypes'
url="http://www.vim.org/scripts/script.php?script_id=${_script_id}"
_url="https://github.com/scrooloose/nerdcommenter"
arch=('any')
license=('custom')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_src_id}")
sha256sums=('c2a153a8538e340576208882b034e6c2de5c689d3bef1a67f7234917d0ded4dd')

package() {
  cd "${srcdir}"

  install -Dm644 plugin/NERD_commenter.vim \
    "${pkgdir}/usr/share/vim/vimfiles/plugin/NERD_commenter.vim"
  install -Dm644 doc/NERD_commenter.txt \
    "${pkgdir}/usr/share/vim/vimfiles/doc/NERD_commenter.txt"
}

# vim:set ts=2 sw=2 et:

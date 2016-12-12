# Maintainer: Carl Mueller  archlinux at carlm e4ward com
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andres Perera <aepd87@gmail.com>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-auctex
pkgver=2.2.18
pkgrel=1
pkgdesc='Macros for latex.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=162'
license=('custom')
depends=('vim')
source=("${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=24799")
md5sums=('468af0f273214c16bf9217a3a729271a')

package() {
  install -D -m644 ${pkgname}.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/tex_auctex.vim
}

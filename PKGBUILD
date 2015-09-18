# Maintainer: Carl Mueller  archlinux at carlm e4ward com
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andres Perera <aepd87@gmail.com>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-auctex
pkgver=2.2.16
pkgrel=1
pkgdesc='Macros for latex.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=162'
license=('custom')
depends=('vim')
source=("${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=23602")
md5sums=('18a74f849930edb7c6312c7f3bdf548f')

package() {
  install -D -m644 ${pkgname}.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/tex_auctex.vim
}

# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor : Aaron Griffin <aaron@archlinux.org>


pkgname=vim-guicolorscheme

pkgver=1.2
pkgrel=7
_scriptid=10162

pkgdesc='Auto convert gui-only colorschemes to 88/256 color terminal schemes'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1809'
license=('GPL')

depends=('vim')

groups=('vim-plugins')

source=("guicolorscheme.vim::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
b2sums=('923334fe1bbcbe339441e2b224daeac09f5559e442b723a3bac4b96371a6be929d9025d1489de4ebe5b61fecd689d2854187538b1b8d8312e7c14ea64c4dd873')


package() {
  install -Dm644 guicolorscheme.vim -t"$pkgdir/usr/share/vim/vimfiles/plugin/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:

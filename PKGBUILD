# Maintainer: a \AT\ arielp /DOT/ com
# Contributor: adaszko, iamcraig, notizblock

pkgname=vim-repeat
pkgver=1.1
_scriptid=19285
pkgrel=2
pkgdesc='Use the repeat command (.) with supported plugins'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2136'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=(repeat.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('267d8b5621903b64d128b175bd3f521a')

package() {
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload
  install -D -m644 ${srcdir}/autoload/repeat.vim ${pkgdir}/usr/share/vim/vimfiles/autoload
}

# vim:set ts=2 sw=2 et:

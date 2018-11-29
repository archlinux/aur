# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: a \AT\ arielp /DOT/ com
# Contributor: adaszko, iamcraig, notizblock

pkgname=vim-repeat
pkgver=1.2
_scriptid=25810
pkgrel=1
pkgdesc='Use the repeat command (.) with supported plugins'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2136'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=(repeat.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('fb06fc840c5ca80c4522549f227c2887')

package() {
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload
  install -D -m644 ${srcdir}/autoload/repeat.vim ${pkgdir}/usr/share/vim/vimfiles/autoload
}

# vim:set ts=2 sw=2 et:

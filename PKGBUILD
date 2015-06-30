# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vim-routeros
pkgver=2014.06.27
pkgrel=2
pkgdesc='Vim syntax highlighting for RouterOS configuration files'
arch=('any')
url='http://forum.mikrotik.com/viewtopic.php?f=9&t=59761#p347143'
license=('custom')
depends=('vim')
source=('routeros.vim.tar.gz::http://forum.mikrotik.com/download/file.php?id=11852&sid=380eac69d0270f4c9d2c8b0fe3ace604'
	'routeros.ftdetect.vim')
sha256sums=('3d0cef278f1dfd91567a941c9bcbb0622f15ddef30b5347c52ee5251236f6bba'
            'e19c0ff009bf5ec8d809546a50fe3c49b2bbc995015ee8564f668a0f4ed98bcf')

package() {
	install -D -m0644 ${srcdir}/rsc.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/routeros.vim
	install -D -m0644 ${srcdir}/routeros.ftdetect.vim ${pkgdir}/usr/share/vim/vimfiles/ftdetect/routeros.vim
}


# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=tcomment-vim
pkgver=3.08.1
pkgrel=2
pkgdesc="An extensible & universal comment vim-plugin that also
handles embedded filetypes"
license=('GPL3')
arch=('any')
url="https://github.com/tomtom/tcomment_vim"
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomtom/${pkgname/-/_}/archive/${pkgver}.tar.gz")
md5sums=('6ea8f4ce78411efba444a0218e111219')

package() {
	install -Dm755 "${srcdir}/${pkgname/-/_}-${pkgver}/plugin/tcomment.vim" \
		"${pkgdir}/usr/share/vim/vimfiles/plugin/tcomment.vim"
	install -Dm755 "${srcdir}/${pkgname/-/_}-${pkgver}/doc/tcomment.txt" \
		"${pkgdir}/usr/share/vim/vimfiles/doc/tcomment.txt"
	install -Dm755 "${srcdir}/${pkgname/-/_}-${pkgver}/autoload/tcomment.vim" \
		"${pkgdir}/usr/share/vim/vimfiles/autoload/tcomment.vim"

	install -Dm644 "${srcdir}/${pkgname/-/_}-${pkgver}/LICENSE.TXT" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

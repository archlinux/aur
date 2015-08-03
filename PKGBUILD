# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=vim-lighttpd
_gitname=vim-syntax-lighttpd
pkgver=1.19
pkgrel=1
pkgdesc="Syntax highlighting for lighttpd config files"
arch=('any')
url="https://github.com/glensc/vim-syntax-lighttpd"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("https://github.com/glensc/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('6e954a1597a5136c7e5469a838c134eb52640dfd9eacd2342c85e41e83740f60')

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  install -Dm644 syntax/lighttpd.vim -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
  install -Dm644 ftdetect/lighttpd.vim -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
}

# vim:set ts=2 sw=2 et:

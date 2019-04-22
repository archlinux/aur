# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=neovim-delimitmate
pkgver=2.7
pkgrel=1
pkgdesc="Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc."
arch=('any')
depends=('neovim')
groups=('neovim-plugins')
url="https://github.com/Raimondi/delimitMate"
license=('None')
source=("https://github.com/Raimondi/delimitMate/archive/${pkgver}.tar.gz")
sha256sums=('36a9ceab86ec33d0a20e312d8034295294536bfd1faf72389158feea510413af')

package() {
  cd "${srcdir}/delimitMate-${pkgver}"
  make
  make install DESTDIR=${pkgdir}/usr/share/nvim/runtime
}

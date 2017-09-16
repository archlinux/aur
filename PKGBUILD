# Maintainer: Lukas Böger <dev  AT  lboeger  DOT  de>

pkgname=vim-quickscope
_name=quick-scope
pkgver=1.1.1
pkgrel=1

pkgdesc='Highlight which characters to target for f, F and family'
arch=('any')
url='https://github.com/unblevable/quick-scope'

groups=('vim-plugins')
depends=('vim>=7.0')
license=('MIT')

source=("${url}/archive/v${pkgver}.tar.gz")
install='vimdoc.install'
sha256sums=('820a4340f51722cf59a44a17832d209b44e5ba9e83f89d6a8b0931cc8368ac1d')

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  install -Dm644 doc/${_name}.txt "${pkgdir}/usr/share/vim/vimfiles/doc/${_name}.txt"
  install -Dm644 plugin/${_name/-/_}.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/${_name/-/_}.vim"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# Maintainer: Robert Kubosz <kuboszrobert at gmail dot com>

pkgname=vim-fastfold
pkgver=5.0
pkgrel=1
pkgdesc='Vim plugin to speed up syntax foldmethod'
arch=('any')
url='https://github.com/Konfekt/FastFold'
groups=('vim-plugins')
depends=('vim')
install='vimdoc.install'
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('8fa4a566bdfe3cc74595d57603686f57')

package() {
  cd "${srcdir}/FastFold-${pkgver}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/FastFold.txt "$installpath/doc/fastfold.txt"
  install -Dm644 plugin/fastfold.vim "$installpath/plugin/fastfold.vim"
}


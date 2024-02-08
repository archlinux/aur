# Maintainer: Robert Kubosz <kuboszrobert at gmail dot com>

pkgname=vim-fastfold
pkgver=5.3
pkgrel=1
pkgdesc='Vim plugin to speed up syntax foldmethod'
arch=('any')
url='https://github.com/Konfekt/FastFold'
groups=('vim-plugins')
depends=('vim')
install='vimdoc.install'
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('8c9fa8c07b262575bf27d7a5d94316db')

package() {
  cd "${srcdir}/FastFold-${pkgver}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/FastFold.txt "$installpath/doc/fastfold.txt"
  install -Dm644 plugin/fastfold.vim "$installpath/plugin/fastfold.vim"
}


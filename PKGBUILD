# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=vim-theme-codeschool
pkgver=1.0.0
pkgrel=1
pkgdesc='CodeSchool like theme for vim'
arch=('any')
groups=('vim-plugins')
url='http://astonj.com/tech/vim-for-ruby-rails-and-a-sexy-theme/'
license=('unknown')
source=('codeschool.vim')
sha256sums=('88b6c41f24edce1f2fab33bc6118cfc0f9bf6b04d890eef79731056b0e48c33d')

package() {
	install -Dm644 "${srcdir}"/codeschool.vim "${pkgdir}"/usr/share/vim/vimfiles/colors/codeschool.vim

}

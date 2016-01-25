# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=vim-dart-plugin-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Syntax highlighting for Dart in Vim'
arch=('any')
url='https://github.com/dart-lang/dart-vim-plugin'
license=('BSD')
depends=('vim')
makedepends=('git')
conflicts=('vim-dart-plugin')
provides=('vim-dart-plugin')
source=("git+https://github.com/dart-lang/dart-vim-plugin.git")
md5sums=('SKIP')

package() {
  cd "$srcdir"/dart-vim-plugin

  installpath="$pkgdir/usr/share/vim/vimfiles"

  install -Dm0644 autoload/dart.vim "$installpath/autoload/dart.vim"
  install -Dm0644 ftdetect/dart.vim "$installpath/ftdetect/dart.vim"
  install -Dm0644 ftplugin/dart.vim "$installpath/ftplugin/dart.vim"
  install -Dm0644 indent/dart.vim "$installpath/indent/dart.vim"
  install -Dm0644 plugin/dart.vim "$installpath/plugin/dart.vim"
  install -Dm0644 syntax/dart.vim "$installpath/syntax/dart.vim"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

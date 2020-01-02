# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-apl
pkgver=0.0.0
pkgrel=1
pkgdesc="vim package for APL syntax and autocompletion"
arch=(any)
url="https://gitlab.com/n9n/vim-apl/"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/-/archive/master/${pkgname}-master.tar.gz")
sha256sums=('db4fc9a2971dcea3c31d3525a20eb15eb9ab87fd82738f95766747124411e327')

package() {
  cd "$srcdir/${pkgname}-master"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/autoload/ $installpath/ftdetect $installpath/ftplugin $installpath/keymap $installpath/syntax
  install -Dm644 autoload/* $installpath/autoload/
  install -Dm644 ftdetect/* $installpath/ftdetect/
  install -Dm644 ftplugin/* $installpath/ftplugin/
  install -Dm644 keymap/* $installpath/keymap/
  install -Dm644 syntax/* $installpath/syntax/
}

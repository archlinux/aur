# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2')
provides=("gitui")
conflicts=('gitui' 'gitui-git')
source=(
  https://github.com/dotiful/AUR/raw/master/gitui-bin/gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar
)
noextract=(gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar)
package() {
  tar -xvf $srcdir/gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar -C $pkgdir --exclude=".*"
}

sha256sums=('79f1234e9be8d8061777d44e3b0217c560ad191d5b70fc1124c8daa650b308c9')

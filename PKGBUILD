# Maintainer: Amaan Hashmi-Ubhi <amaanhub at gmail dot com>

# need to install 'ncurses5-compat-libs' to make this work from AUR

pkgname=haskell-taskell-bin
_pkgname=taskell
pkgver=1.10.1
pkgrel=1
epoch=
pkgdesc="A CLI kanban board/task manager for Mac and Linux with vim style key-bindings"
arch=('x86_64')
url="https://github.com/smallhadroncollider/taskell/"
license=('unknown')
conflicts=('haskell-taskell')
source=("https://github.com/smallhadroncollider/$_pkgname/releases/download/$pkgver/${_pkgname}-${pkgver}_x86-64-linux.tar.gz")
# figure out how to create this checksum for the tar.gz
sha512sums=('SKIP')
validpgpkeys=('SKIP')

package() {
	install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}


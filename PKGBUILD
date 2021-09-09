# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

# need to install 'ncurses5-compat-libs' from AUR

pkgname=haskell-taskell-bin
_pkgname=taskell
pkgver=1.11.4
pkgrel=1
epoch=
pkgdesc="A CLI kanban board/task manager for Mac and Linux with vim style key-bindings"
arch=('x86_64')
url="https://github.com/smallhadroncollider/taskell/"
license=('unknown')
depends=('ncurses5-compat-libs')
conflicts=('haskell-taskell')
source=("https://github.com/smallhadroncollider/$_pkgname/releases/download/$pkgver/${_pkgname}-${pkgver}_x86-64-linux.tar.gz")
sha512sums=('be081687448fc99886f38a628dc27f66c0cbec6110daad30176a8f3aa42b212b03a644f47179a492159b4ed7918e7ca23a698b36a2b6c3ba97543a7ca0216043')
validpgpkeys=('SKIP')

package() {
	install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}


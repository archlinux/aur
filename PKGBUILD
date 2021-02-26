# Maintainer: Amaan Hashmi-Ubhi <amaanhub at gmail dot com>

# need to install 'ncurses5-compat-libs' to make this work from AUR

pkgname=haskell-taskell-bin
_pkgname=taskell
pkgver=1.10.1
pkgrel=2
epoch=
pkgdesc="A CLI kanban board/task manager for Mac and Linux with vim style key-bindings"
arch=('x86_64')
url="https://github.com/smallhadroncollider/taskell/"
license=('unknown')
conflicts=('haskell-taskell')
source=("https://github.com/smallhadroncollider/$_pkgname/releases/download/$pkgver/${_pkgname}-${pkgver}_x86-64-linux.tar.gz")
sha512sums=('77cf43670ec4cd26904dfd32d1541a4132b20e13b76b93ff8ee5096665ea700f62e5ceff47d2759c26a1406879132d357263021cddbcd896599d39ba77fead3f')
validpgpkeys=('SKIP')

package() {
	install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}


# Maintainer: Harish Rusum <harish.rusum@gmail.com>
pkgname=todo-manager
pkgver=1
pkgrel=1
pkgdesc="A simple task management tui using gum cli"
arch=('x86_64')
url="https://github.com/Harish-Rusum/todo.git"
license=('MIT')
depends=('gum')
makedepends=()
install="todo.install"
source=("todo::https://raw.githubusercontent.com/Harish-Rusum/todo/main/todo.sh")
sha256sums=("SKIP")

# prepare() {
# }
#
# build() {
# }

package() {
	install -Dm755 ./todo "$pkgdir/usr/bin/todo"
}

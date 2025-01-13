# Maintainer: Harish Rusum <harish.rusum@gmail.com>
pkgname=todo-manager
pkgver=1
pkgrel=1
pkgdesc="A simple task management TUI using gum CLI"
arch=('x86_64')
url="https://github.com/Harish-Rusum/todo.git"
license=('MIT')
depends=('gum')
source=("todo::https://raw.githubusercontent.com/Harish-Rusum/todo/main/todo.sh")
sha256sums=("SKIP")

package() {
    install -Dm755 "${srcdir}/todo" "$pkgdir/usr/bin/todo"
}

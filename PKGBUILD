#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=py-todo
_pkgname=todo
_gitname=py-todo
pkgver=1.3.3
pkgrel=1
pkgdesc='A Lightweight Reminder / todo-list in cli.'
arch=('any')
url="https://github.com/aesophor/py-todo"
license=('MIT')
depends=('python')
makedepends=('git')
source=('git+https://github.com/aesophor/py-todo.git')
sha256sums=('SKIP')

package() {
    install -D -m755 "$srcdir/$_gitname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/bin/licenses/$_pkgname/LICENSE"
}

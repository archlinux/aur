pkgname=todo-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="The cli tool for the Todo Server"
arch=('any')
url="https://github.com/nldk/todoCLI"
license=('MIT') # or whatever you use
depends=('jre-openjdk')
source=("https://github.com/nldk/todoCLI/releases/download/todo-cli/todo-cli-1.0.0.jar"
        "https://github.com/nldk/todoCLI/releases/download/todo-cli/todo")
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm644 todo-cli-1.0.0.jar "$pkgdir/usr/share/todo-cli/todo-cli-1.0.0.jar"
  install -Dm755 todo "$pkgdir/usr/bin/todo"
}

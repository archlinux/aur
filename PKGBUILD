# Maintainer: Your Name <youremail@example.com>

pkgname=flippen-text
pkgver=1.0
pkgrel=1
pkgdesc="Простой редактор текста"
arch=('any')
url="https://github.com/SergeyDash/flippen-text"
license=('GPL')
depends=('python' 'tkinter')
source=("main.py")
sha256sums=('SKIP')  # Если у нас нет архива, можем использовать 'SKIP'

package() {
    install -Dm755 "$srcdir/main.py" "$pkgdir/usr/bin/flippen-text"
}

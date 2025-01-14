pkgname=singletask
pkgver=1.0.0
pkgrel=1
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
source=("singletask.py" "singletask.desktop")
md5sums=('SKIP' 'SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/singletask.py" "$pkgdir/usr/bin/singletask"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/singletask.desktop" "$pkgdir/usr/share/applications/singletask.desktop"
}

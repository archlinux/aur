# Maintainer: Edwin Löffler edwin.frank.loeffler@gmail.com

pkgname=todolist
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple command line tool written in python to manage a to-do list"
arch=("any")
depends=("python")
url="https://github.com/edwloef/todolist"
license=('MIT')
source=("git://github.com/edwloef/todolist")
sha1sums=('SKIP')

package() {
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/todolist

    rm "${pkgdir}"/usr/bin/todolist
    rm "${pkgdir}"/usr/share/todolist

    install -Dm 755 "${srcdir}"/todolist/todolist "${pkgdir}"/usr/bin
    install -Dm 755 "${srcdir}"/todolist/todolist.py "${pkgdir}"/usr/share/todolist
}

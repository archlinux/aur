# Maintainer: Carlos Pita <carlosjosepita@gmail.com>

pkgname=maximal
pkgver=20180705
pkgrel=1
pkgdesc='Hides the titlebar when a window is maximized in Gnome/Cinnamon'
arch=('any')
depends=('python-xlib')
url='https://github.com/memeplex/maximal'
source=("git+$url.git")
md5sums=('SKIP')

package() {
    install -D $srcdir/maximal/maximal $pkgdir/usr/bin/maximal
}

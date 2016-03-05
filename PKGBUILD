# Maintainer: Gerald Nunn <gerald dot b dot nunn at gmail dot com>

pkgname=visual-grep
pkgver=0.30
pkgrel=1
pkgdesc="A GTK 3 based GUI for grep"
arch=('x86_64')
url="http://github.com/gnunn1/vgrep"
license=('MPL')
depends=('gtk3')
source_x86_64=(https://github.com/gnunn1/vgrep/releases/download/$pkgver/vgrep.zip)
md5sums_x86_64=('bf2a54ee06da2d51179cce0bfb78c2a5')

package() {
    cp -ar $srcdir/usr $pkgdir/usr
}

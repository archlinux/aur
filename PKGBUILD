pkgname=groonga-gobject
pkgver=1.0.1
pkgrel=4
pkgdesc="GObject wrapper of Groonga."
arch=('i686' 'x86_64' 'armv7h')
url="http://groonga.org/"
license=('LGPL3')
source=("http://packages.groonga.org/source/groonga-gobject/$pkgname-$pkgver.tar.gz")
depends=('groonga' 'gobject-introspection')
optdepends=('cutter-test_framework')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

sha1sums=('9614288b0b51efa8bd3374dcdd3e9c7295fe7873')

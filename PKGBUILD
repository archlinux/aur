pkgname=ojcsh
pkgver=2.7.8
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/ABO7GAG/OJC-shell"
license=('GPL-3.0-or-later')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ABO7GAG/OJC-shell/archive/refs/tags/V2.7.8.tar.gz")
sha256sums=('8d213e13d06b7726951bf977a6b0d0df5c878ba046acf4cacadcd4273dae7122')

build() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}

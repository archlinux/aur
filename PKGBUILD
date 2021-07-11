# Maintainer Alfred Jophy alfredjophy@protonmail.com
pkgname=motivate
pkgdesc="Gives you a motivational quote"
pkgver=1.3.1
pkgrel=1
url="https://github.com/AlfredEVOL/motivate"
arch=('x86_64')
license=('MIT')
source=("https://github.com/AlfredEVOL/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')
package() {
        
        mkdir -p $pkgdir/usr/share/$pkgname
        mkdir -p $pkgdir/usr/bin
        cp build/motivate "$pkgdir/usr/bin/"
        cp build/data/quotes.map $pkgdir/usr/share/$pkgname
        cp build/data/quotes.txt  $pkgdir/usr/share/$pkgname
}

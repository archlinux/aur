# Maintainer Alfred Jophy alfredjophy@protonmail.com
pkgname=motivate
pkgdesc="Gives you a motivational quote"
pkgver=1.3.0
pkgrel=1
url="https://github.com/AlfredEVOL/motivate"
arch=('x86_64')
license=('MIT')
source=("https://github.com/AlfredEVOL/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')
package() {
        
        mkdir -p $pkgdir/usr/share/$pkgname
        mkdir -p $pkgdir/usr/bin
        cp motivate "$pkgdir/usr/bin/"
        cp data/quotes.map $pkgdir/usr/share/$pkgname
        cp data/quotes.txt  $pkgdir/usr/share/$pkgname
}

pkgname=privatebin
pkgver=1.1
pkgrel=1
url='privatebin.info'
arch=("any")
license=("zlib")
depends=("php" "php-gd")
source=("$pkgname-$pkgver.tar.gz::https://github.com/PrivateBin/PrivateBin/archive/$pkgver.tar.gz")
md5sums=('623be6c7f72f13d4269999941fed18d9')

package(){
    cd PrivateBin-$pkgver
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
    cp -R * "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

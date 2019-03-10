pkgname=consolas
pkgver='8.2'
pkgrel=1
pkgdesc="Latest consolas font with open source license from Microsoft."
license=('Public-Domain')
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("https://github.com/piotrgrochowski/$pkgname/archive/$pkgver.tar.gz")
install=$pkgname.install
md5sums=('3a8020f328c6faf244372a6e7e926071')

package() {
    install -dm 755 "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "$srcdir/Consolas-$pkgver/consolasmod$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "$srcdir/Consolas-$pkgver/consolasboldmod$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF"
}

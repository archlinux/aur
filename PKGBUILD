# Contributor: thomasqueirozb
# Maintainer:  spsf64

pkgname=giftedmotion
pkgver=1.23
pkgrel=1
pkgdesc='GiftedMotion is a free and easy to use open source GIF animator.'
arch=('x86_64')
license=('GPL2')
url="http://www.onyxbits.de/giftedmotion"
depends=('java-runtime<=8')

source=("$pkgname"
        "$pkgname.desktop"
        "$pkgname.png"
        "http://www.onyxbits.de/sites/default/files/download/16/$pkgname-$pkgver.jar")

md5sums=('f32cb9f27b07343f95f2e34e98e984d1'
         'da2a20c1c33fc1e055c781b18e896870'
         '00eeefc57d0f97713b6114a2e82db57f'
         'bfdf2f92794fc2b34f4455663143b9b2')


package() {
    cd "$srcdir"
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
}


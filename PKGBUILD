# Maintainer: spsf64 <spsf64  at  g m a i l .com>
# Maintainer: thomasqueirozb <thomasqueirozb  at  g m a i l .com>

pkgname=giftedmotion
pkgver=1.23
pkgrel=3
pkgdesc='Free and easy to use open source GIF animator.'
arch=('x86_64')
license=('GPL2')
url="https://www.onyxbits.de/giftedmotion"
depends=('java-runtime<=8')

# The icon provided is not provided by the giftedmotion project
source=("$pkgname"
        "$pkgname.desktop"
        "$pkgname.png"
        "https://www.onyxbits.de/sites/default/files/download/16/$pkgname-$pkgver.jar")

md5sums=('f32cb9f27b07343f95f2e34e98e984d1'
         '6d3cd068b281613dfb362dc07b6ada19'
         '1ce538c5b302653d7c222f4aed00b9eb'
         'bfdf2f92794fc2b34f4455663143b9b2')


package() {
    cd "$srcdir"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -Dm644 $pkgname-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
}


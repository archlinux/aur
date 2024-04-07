# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=jwx
pkgver=3.0
pkgrel=1
pkgdesc="A Java short-wave weatherfax receiver/converter"
arch=('any')
url="https://arachnoid.com/JWX/"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("https://arachnoid.com/JWX/resources/JWX.jar" "$pkgname.sh" "$pkgname.desktop")
sha256sums=('6fedb44ce127995abda23626e1b9e47c7d9c444f449ebfe5863d8b0a35e9f1bd'
            '1b1c17ae670b857a94d7ad84e06292687860ebd684aee2dc85067fd746546a85'
            '3c0fd14c64132870ff08f7c2d901339262b6e6ffeff84981f6edf368f9ea43c9')

package() {
    install -Dm644 "$srcdir/JWX.jar" "$pkgdir/usr/share/java/$pkgname/JWX.jar"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

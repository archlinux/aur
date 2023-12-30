# Maintainer: Jamie King <git@ironveil.cloud>
pkgname=ttf-inter

pkgver=4.0
pkgrel=1
pkgdesc="The Inter font family."
arch=("any")
url="https://github.com/rsms/inter"
license=("OFL")
depends=(fontconfig)
source=("https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip")
md5sums=("7a198bd4c103c01dc09f7b6abf92a06a")

package() {
    cd "$srcdir"

    install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    
    install -d -m755 "$pkgdir/usr/share/fonts/inter"
    install -D -m644 Inter.ttc "$pkgdir/usr/share/fonts/inter/Inter.ttc"
    install -D -m644 *.ttf "$pkgdir/usr/share/fonts/inter"
}

# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=4.1
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('17f8c0712b3214352df6c5b2b053e67a30334a63fd8be63a39db1072f2df2f32')
sha256sums_pentium4=('17f8c0712b3214352df6c5b2b053e67a30334a63fd8be63a39db1072f2df2f32')
sha256sums_x86_64=('6a813f97b5cbd3543fb2eb5c3c3e4edefe23255d637ca1faafb61224113a6a4b')
sha256sums_aarch64=('cd52f403a615a953306c90e9be21d27aa400e1edc4d55cc8e7bd12e6a4a1945d')

package() {
    cd "$srcdir"

    install -Dm755 clx "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 "$pkgdir/usr/share/man/man1/clx.1"
}

# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_pentium4=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_64-bit.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('8e13c29a59b7a3e2fea1ac9ccaa5e5c9ea398f901d3a7762fb92c1e76c615085')
sha256sums_pentium4=('8e13c29a59b7a3e2fea1ac9ccaa5e5c9ea398f901d3a7762fb92c1e76c615085')
sha256sums_x86_64=('8e13c29a59b7a3e2fea1ac9ccaa5e5c9ea398f901d3a7762fb92c1e76c615085')
sha256sums_aarch64=('8e13c29a59b7a3e2fea1ac9ccaa5e5c9ea398f901d3a7762fb92c1e76c615085')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}

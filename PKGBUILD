# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=3.0
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

sha256sums_i686=('d080a6c474ca83ba31b3e87f1123bec04236c567d264a1d9616d8512f60cb492')
sha256sums_pentium4=('d080a6c474ca83ba31b3e87f1123bec04236c567d264a1d9616d8512f60cb492')
sha256sums_x86_64=('d080a6c474ca83ba31b3e87f1123bec04236c567d264a1d9616d8512f60cb492')
sha256sums_aarch64=('d080a6c474ca83ba31b3e87f1123bec04236c567d264a1d9616d8512f60cb492')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}

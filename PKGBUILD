# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver-1686.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_64-bit.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('130fddba5b985c30f619c55dfdc2406805c001ed0e4a0f568b557e2944e06d5f')
sha256sums_pentium4=('130fddba5b985c30f619c55dfdc2406805c001ed0e4a0f568b557e2944e06d5f')
sha256sums_x86_64=('b24ed54949501b46c18e77376ee1ea92679f6c9495aeed73a4de33805b853cb9')
sha256sums_aarch64=('99ed4537defa6bd7ed4a65b7543cc8d144b593460536e374adb5a87cb5e6ef7e')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}

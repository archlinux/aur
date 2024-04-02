# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=3.6
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver-1686.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('a1ab5bac5b3debd21509e145ff2a17cb46fb086bc38c6486cf55b00713e18d72')
sha256sums_pentium4=('a1ab5bac5b3debd21509e145ff2a17cb46fb086bc38c6486cf55b00713e18d72')
sha256sums_x86_64=('1d4ae195720813af7584d2ce4db4e7fac68eb1c555e763353a52ea76a33c2f93')
sha256sums_aarch64=('5ba6ebc8f2f5131cd22308cee5bec7a020ab8a2ee4abcd1e8c6830446c049502')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}

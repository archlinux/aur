# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=3.1.3
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

sha256sums_i686=('3e35b9a5a5a39b1ac28472b97e8db1d06f4e4f0f44396e765143db0cbd2fa452')
sha256sums_pentium4=('3e35b9a5a5a39b1ac28472b97e8db1d06f4e4f0f44396e765143db0cbd2fa452')
sha256sums_x86_64=('e090342ed36de4e7413c0e72c8038849c58f9f4de4b585f2b55a5d68b17e30bf')
sha256sums_aarch64=('6b948407858aa43bb293faf24e66aff2ee0e341137ebd452636bc480933807a9')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}

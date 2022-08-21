# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=statping-ng-bin
_pkgname=statping-ng
pkgver=0.90.80
pkgrel=1
pkgdesc='Web and app status monitoring for any type of project (binary release)'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/statping-ng/statping-ng'
license=('GPL3')
conflicts=("$_pkgname" 'statping')
source=("LICENSE::https://raw.githubusercontent.com/$_pkgname/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-amd64.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-386.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm64.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm-7.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm-6.tar.gz")
sha256sums=('e99aaa9fd81e548c682d8b39ff84ee349f02b4549ab74e8d8855c31c09b71d5e')
sha256sums_x86_64=('c82e1c09775bdf40ee6e742f2b63e9630e70a058bc988423230994ad9bcfc87a')
sha256sums_i686=('1b8b0cac093d1f0d9b646ea1c25483c7494b00ce2868b573d3aa31d806e9d6f3')
sha256sums_aarch64=('d4b0141772a632d6db8af4fbe5d43da019fded264405f4e2a03c7aaeabb0fa73')
sha256sums_armv7h=('05806be5e5b66751283e39c193335d266a9268821aab8710183eb74b06cc8bb2')
sha256sums_armv6h=('c1599928ed1ff9cd6ff6bfd695064be7cb2790e1543cb0b59eeca605007cf819')

package() {
    install -Dm755 "$srcdir/statping" "$pkgdir/usr/bin/statping"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ameya Shenoy <archlinux@codingcoffee.me>

_pkgname='kgctl'

pkgname="$_pkgname-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="Kilo command line tool for inspecting and interacting with clusters"
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://github.com/squat/kilo"
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver::https://github.com/squat/kilo/releases/download/$pkgver/$_pkgname-linux-amd64")
source_aarch64=("$_pkgname-$pkgver::https://github.com/squat/kilo/releases/download/$pkgver/$_pkgname-linux-arm64")
source_armv7h=("$_pkgname-$pkgver::https://github.com/squat/kilo/releases/download/$pkgver/$_pkgname-linux-arm")
source_armv7l=("$_pkgname-$pkgver::https://github.com/squat/kilo/releases/download/$pkgver/$_pkgname-linux-arm")
sha256sums_x86_64=('4ff78c31e4c301544da947072dedd85d6ce884b0e9554d610ee1546cdbc855aa')
sha256sums_aarch64=('3080d29c0b4b9123376181ce570fa4a69783acb7f06506072c0e61ae87506512')
sha256sums_armv7h=('81d771d16b508e0b6646ca6f60aac8241d4799975bcf44b46ed598e05d0d4675')
sha256sums_armv7l=('81d771d16b508e0b6646ca6f60aac8241d4799975bcf44b46ed598e05d0d4675')

package() {
  install -D -m755 "./$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}


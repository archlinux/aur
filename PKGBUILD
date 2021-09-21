# Maintainer: Ameya Shenoy <archlinux@codingcoffee.me>

_pkgname='kgctl'

pkgname="$_pkgname-bin"
pkgver=0.3.1
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
sha256sums_x86_64=('7dd9d4b610376d73ebb61ebecfa841031cc36bd3810bd145d83003e2b624ddc3')
sha256sums_aarch64=('af5adfcc105367d68c45d7460c30b7851d137ede8aa3d8b08c68701ed2c065a2')
sha256sums_armv7h=('004b4835805cb485ab6c297eb85a4c2b77d085a555f1c9b7375d214a69b6d12d')
sha256sums_armv7l=('004b4835805cb485ab6c297eb85a4c2b77d085a555f1c9b7375d214a69b6d12d')

package() {
  install -D -m755 "./$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}


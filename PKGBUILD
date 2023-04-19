# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.23.1
pkgrel=1
pkgdesc='For when you really just want to serve some files over HTTP right now!'
provides=('miniserve')
conflicts=('miniserve')
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/svenstaro/miniserve'
license=('MIT')
source_armv7h=("miniserve-$pkgver-armv7h"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-${pkgver}-armv7-unknown-linux-musleabihf")
source_x86_64=("miniserve-$pkgver-x86_64"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("miniserve-$pkgver-aarch64"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-${pkgver}-aarch64-unknown-linux-musl")
sha256sums_x86_64=('9e29560b206e05ec80cd2bda350e5ad62fb032dd20a9996d5a15d738cd2a5421')
sha256sums_aarch64=('11dcfaeb5cdab1df8fedfb3b02397901c672dc97901ad354b6bc6dd03b8dd012')
sha256sums_armv7h=('4fba46f0685e210469353e82c3d267afed10c71b78f2f783ac6355076f5433fd')

package() {
	install -Dm755 "miniserve-$pkgver-${CARCH}" "$pkgdir/usr/bin/miniserve"
}

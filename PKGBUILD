# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.23.0
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
sha256sums_x86_64=('122576cc150d0487d349f19e0b02243823d5d8697ac4d6fdab7e0dfcd81dc34c')
sha256sums_aarch64=('12285105074004c0ce94589e965c30feed37957d2deea9dc10b7faa3d67acf1f')
sha256sums_armv7h=('0c3e1a3343932a57b5298f536b85d3eb8520d4ee5cfc159e1e5bc554bdf83931')

package() {
	install -Dm755 "miniserve-$pkgver-${CARCH}" "$pkgdir/usr/bin/miniserve"
}

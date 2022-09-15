# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.21.0
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
sha256sums_x86_64=('0431dde2ae2d2a017aaee24e3049668f867e259dc7e32367df59dc2d590d9412')
sha256sums_aarch64=('5f20e4c78a819ff91dbf72e6581e942ec6487f8c74e8b63c5045a5e9569e956e')
sha256sums_armv7h=('d1e12a23c6a913c4943a21682488918d8ef4cdf55fd0181c33fe43c76e6c3b36')

package() {
	install -Dm755 "miniserve-$pkgver-${CARCH}" "$pkgdir/usr/bin/miniserve"
}

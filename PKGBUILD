# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.22.0
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
sha256sums_x86_64=('00a330a0735b780d1fc39770de0294be289fe7147b5742616a80942a784833cd')
sha256sums_aarch64=('d2776ce051ff5a45541723d333a671fe2532d1344f5ccb3ce7263d292479e063')
sha256sums_armv7h=('4e012ef17e8785e19fb4b5644d45678164a84aeae15d6f36b835db162fa362e4')

package() {
	install -Dm755 "miniserve-$pkgver-${CARCH}" "$pkgdir/usr/bin/miniserve"
}

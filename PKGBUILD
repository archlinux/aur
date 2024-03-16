# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.27.1
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
sha256sums_x86_64=('4cfdd7e77dd50808ea9422c51c2036fcf2a85649dff8402144a9b07a06e31735')
sha256sums_aarch64=('a7cc227e400d070e109de085d0a0955dba0af90a1db129fa70cdeab3f5b5524f')
sha256sums_armv7h=('fc1b7b863e36d88d912c9471e96bf1510608d79c0b50d3dac1288d60143ae13b')

package() {
	install -Dm755 "miniserve-$pkgver-${CARCH}" "$pkgdir/usr/bin/miniserve"
}

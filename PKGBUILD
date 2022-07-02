# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=miniserve-bin
pkgver=0.20.0
pkgrel=1
pkgdesc='For when you really just want to serve some files over HTTP right now!'
provides=('miniserve')
conflicts=('miniserve')
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/svenstaro/miniserve'
license=('MIT')
source_armv7h=("miniserve-$pkgver"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-v${pkgver}-armv7-unknown-linux-musleabihf")
source_x86_64=("miniserve-$pkgver"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("miniserve-$pkgver"::"https://github.com/svenstaro/miniserve/releases/download/v${pkgver}/miniserve-v${pkgver}-aarch64-unknown-linux-musl")
sha256sums_x86_64=('4570d04a205f2f8a074f00f7f4906cf1bb0e1f4f44754b7eef670a2c4cf105f2')
sha256sums_aarch64=('e2293fdf04e0b7cefde358370f7ccad5570f5d2e24494175383df5b0431d73c3')
sha256sums_armv7h=('48c9b67e2b28794e8918d681bb25d57bdffd0ac94acb06e2d64f8ed731eb6184')

package() {
	install -Dm755 "miniserve-$pkgver" "$pkgdir/usr/bin/miniserve"
}

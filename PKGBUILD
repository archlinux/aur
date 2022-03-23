# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')
source_x86_64=(sloth-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)
md5sums_x86_64=('a64522dc1c3925e026d4f73d4d1db470')
md5sums_aarch64=('8d6c4295db79fd304beadf399bd3173a')
md5sums_armv7h=('797f069e9ea8556b49447d17a524f22d')

package() {
  install -Dm755 sloth-${arch} "$pkgdir/usr/bin/sloth"
}

# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.12.0 # renovate: datasource=github-releases depName=slok/sloth
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('e2eb99b9b10a5e9f773326323b3fd43bb24907df79a42c0125671e1394df5d59')
sha256sums_aarch64=('fd4153a665698a7b62a9c95107b6774f5d9fa5c99cbfa1066119b89d96a260ec')
sha256sums_armv7h=('0a4d10df1471208cb215b9b0229f3c3d7ad07750fc92feeb69be32f6d0100ade')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

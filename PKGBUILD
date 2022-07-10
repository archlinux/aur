# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.10.0
pkgrel=2
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('0110f72e40a674469715e63afc3c75cf4541241a1399f37cbf5ca3ef80a9930d')
sha256sums_aarch64=('641a0271b4fb29fcad199710741c447f1e24f260a5a32be0fa4cb248f08e0745')
sha256sums_armv7h=('246d884e3957a6868af71d80837d839ef8ba7695c5cdf64cf81e1047aa55d29b')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

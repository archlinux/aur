# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.13.0 # renovate: datasource=github-releases depName=slok/sloth
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('8fb845e6f1ab2c0af2b48e0b4849b42b72ecb422fadabc8a800d3d6deeca3ff2')
sha256sums_aarch64=('e51d6ac2bf7fb331cb484e7ac2fe520b8e3983f46c3f8108ddb060188d8de957')
sha256sums_armv7h=('183f072dce8e2bd171506994ae2a55bb282251b01fc5cecc0a2839789910a3ce')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.14.0 # renovate: datasource=github-releases depName=slok/sloth
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('e033fdf6403945b8d57502959fc790151c26bffcca645d431f9610d8cb0faf02')
sha256sums_aarch64=('1a0a8950d8faf318a4898d05944db2f399d042190ad682a304e74b1bfcdc887e')
sha256sums_armv7h=('bffc85134677f351cf6c538ebb1c0241c55b2f713379caa6a5b7ccbd65bb8e51')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

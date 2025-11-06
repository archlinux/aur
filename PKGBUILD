# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.15.0 # renovate: datasource=github-releases depName=slok/sloth
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('e7103927461ed91c755fcaef913b102c76364d63d5a9f07bb27d801232bfb93f')
sha256sums_aarch64=('751edc776e0febbda41e568a6d48d37622ce2e05dffe17b75a824ee38c2bcd94')
sha256sums_armv7h=('a8513a257d38fb65fadbbaec95b165c0d1d2eca69a8fdd3640a9abe9f1a4f45d')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

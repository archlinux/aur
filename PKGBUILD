# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=sloth-bin
pkgver=0.16.0 # renovate: datasource=github-releases depName=slok/sloth
pkgrel=1
pkgdesc="Easy and simple Prometheus SLO (service level objectives) generator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/slok/sloth"
license=('Apache')

source_x86_64=(sloth-${pkgver}-x86_64::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-amd64)
source_aarch64=(sloth-$pkgver-aarch64::https://github.com/slok/sloth/releases/download/v${pkgver}/sloth-linux-arm64)
source_armv7h=(sloth-${pkgver}-armv7h::https://github.com/slok/sloth/releases/download/v$pkgver/sloth-linux-arm-v7)

sha256sums_x86_64=('1cecaa50853abbb3669a928612b523df8174d258ea6f2a3c8f048e5fc5af90b2')
sha256sums_aarch64=('7b570c465df3cc997e744dfcfcea83c3559bba6b12f4d6165994925419cbb41c')
sha256sums_armv7h=('4b01c95f76738e1b0332a710e7904b4a1639231f2085a59a2cbb0c528bd4dcd8')

package() {
  install -Dm755 sloth-${pkgver}-${arch} "$pkgdir/usr/bin/sloth"
}

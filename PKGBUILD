# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
license=('MIT')
pkgver=0.0.9
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('b01a3b4a927a1bfa94261009f67cf7cc65f3570f770b6f8b4b079f4cbf0f6193')
sha256sums_aarch64=('ce325ccb404d726147928f89345c307f9798428a4221741b22020761cb716c21')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}

# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('6803d96161bcea72f83d4d7e1ce0214e6b42cb23dcce402d78fb9d68a5f8c600')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://github.com/superbusinesstools/ultrv-cli"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://github.com/superbusinesstools/ultrv-cli/releases/download/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

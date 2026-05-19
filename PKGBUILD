# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('89e138d11bcbf16e896725cfd9cea57b794d996cd4798f02a8ea521c7918d5fc')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

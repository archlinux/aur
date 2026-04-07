# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4d86d014ac2407c1cff6721ae837f98ed6d62d9c19f6008419e82fa740b430ef')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

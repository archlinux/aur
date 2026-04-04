# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a083d0ca567298624d70f3c27b3e147ba6022c6a2114e64cc89290c84d476a46')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

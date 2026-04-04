# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('97415220da5bbff1501eb30da1d7b8529c5a187794249feab99746358334b796')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}

# Maintainer: Ased Mammad <mammad.ased@gmail.com>

pkgname=eitaa-bin
pkgver=3.0.12
pkgrel=1
license=('Custom')
pkgdesc="Official Desktop version of Eitaa messaging app - Static binaries"
depends=()
makedepends=()
provides=('Eitaa')
arch=('x86_64')
url="https://eitaa.com"
source_x86_64=("$pkgname-v$pkgver.tar.xz::https://eitaa.com/app/desktop/linux")

sha256sums_x86_64=('24792d51851545118df14b6118a3f4ef238fd8f783dfee0e461c1bffa3cc22b8')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./Eitaa/Eitaa
}

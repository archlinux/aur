# Maintainer: Naglis Jonaitis <naglis@mailbox.org>
# Developer: Softemia <info@softemia.lt>
pkgname=mcard-toolbox
pkgver=1.3.4.0
pkgrel=1
pkgdesc="mCard Toolbox"
url="https://softemia.lt/downloads/"
arch=('x86_64' 'aarch64')
license=('custom')
depends=('pcsclite>=1.5' 'qt5-base')
source_x86_64=("https://softemia.lt/wp-content/uploads/2023/07/$pkgname-amd64-$pkgver.deb")
source_aarch64=("https://softemia.lt/wp-content/uploads/2023/07/$pkgname-arm64-$pkgver.deb")
sha256sums_x86_64=('607fceb3b5598f988d6a4b8a882b46df32452a704e213c9145467a39e280291f')
sha256sums_aarch64=('9d87e68e62726034b76b8a53a8134eb0c3b084f8fca5626c8422611a9de112a0')

package() {
  bsdtar xf "data.tar.xz" -C "${pkgdir}"
}

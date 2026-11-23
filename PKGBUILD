# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
pkgname=fido2-manage-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="An open-source, cross-platform tool for managing FIDO2 security keys over USB and NFC"
arch=('x86_64')
url="https://www.token2.com/site/page/fido2-token-management-tool-fido2-manage-exe"
license=('BSD-2-Clause')
depends=('gtk3' 'pcsclite' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/token2/${pkgname%-bin}/releases/download/${pkgver}/Token2-key-manager_${pkgver}_amd64.deb")
sha256sums=('af6e0ea0b8429d6c389efc91431e768c427230508db369eabedc9889493b3d5f')

package() {
  bsdtar xf data.tar.zst -C "$pkgdir/"
}

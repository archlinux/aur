# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
pkgname=fido2-manage-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A command-line tool for managing FIDO2 security keys"
arch=('x86_64')
url="https://www.token2.com/site/page/fido2-token-management-tool-fido2-manage-exe"
license=('BSD-2-Clause')
depends=('gtk3' 'pcsclite' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/token2/${pkgname%-bin}/releases/download/${pkgver}/Token2-key-manager_${pkgver}_amd64.deb")
sha256sums=('2a9e8ebeda91b5e238da2d4d8b2f229eb9d1edc3db66b7a6332467520d711e46')

package() {
  bsdtar xf data.tar.zst -C "$pkgdir/"
}

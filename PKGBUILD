## Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-bitwarden
pkgver=2023.4.0
pkgrel=1
pkgdesc='Bitwarden addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/4103016/bitwarden_password_manager-$pgver.xpi")
sha512sums=('b35386ee902bfab9fdf43fba91f776a866a4dd3b3558d52d9d86c53b4b0fc91918e4a94fa11e196e7d0881e557cb23f9b523e0ab212a0f340ed42ebd222e2884')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

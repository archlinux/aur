## Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-bitwarden
pkgver=2022.8.0
pkgrel=1
pkgdesc='Bitwarden addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3986147/bitwarden_password_manager-$pgver.xpi")
sha512sums=('8a84f2faf471fe3e0990d9b277ce6246bc74ec955b5f2ce902b33991785242559355f0a016dfedfd3bd4908593489c3f55261e71e32d13ecc48c1db895b775b0')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}


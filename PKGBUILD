## Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-bitwarden
pkgver=2022.9.1
pkgrel=1
pkgdesc='Bitwarden addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/4002564/bitwarden_password_manager-$pgver.xpi")
sha512sums=('eea2897c1addf33c49844996275c6d81d004e5a0f9059b61bfd98478df7ffdd8d5576603d92e5bdb3b9c1e187c71f7b130206403c015cb65cf08aafad5e322ad')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

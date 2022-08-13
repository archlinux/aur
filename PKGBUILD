pkgname=firefox-extension-bitwarden
pkgver=2022.8.0
pkgrel=1
pkgdesc='Bitwarden addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("firefox-bitwarden-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3775487/bitwarden_free_password_manager-${pkgver}-an+fx.xpi")
noextract=("firefox-bitwarden-${pkgver}.xpi")
sha512sums=('2406ea4e3791340649a17ac4c47f1b03212cf68f83a2fa70c772f8634faadf1ffe59d302bfc0b86bf4336502aed504de62e1fdc3d816bad6814f03bbcf26c6ee')

package() {
  install -Dm644 "firefox-bitwarden-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}


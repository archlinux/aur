pkgname=firefox-extension-bitwarden-bin
pkgver=2024.1.0
_mozid=4219948
pkgrel=1
pkgdesc='Bitwarden addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("firefox-bitwarden-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_mozid}/bitwarden_free_password_manager-${pkgver}-an+fx.xpi")
noextract=("firefox-bitwarden-${pkgver}.xpi")
sha512sums=('1aa1489ce3a683c7404b291912dc99919e067a3538b2b059bba852c93a3aa5d63bb9ce230766f94da6307053d1f56da2a1968ade89442514c5b18fedbbf4eac6')

package() {
  install -Dm644 "firefox-bitwarden-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}


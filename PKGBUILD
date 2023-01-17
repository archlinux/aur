pkgname=firefox-extension-bitwarden
pkgver=2023.1.0
_mozid=4054938
pkgrel=1
pkgdesc='Bitwarden addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("firefox-bitwarden-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_mozid}/bitwarden_free_password_manager-${pkgver}-an+fx.xpi")
noextract=("firefox-bitwarden-${pkgver}.xpi")
sha512sums=('12bc4a05e670d28c8b970d58f853e6dd9628d45c85f2d94331ab08f358c48bafafb3bee06acab98931ca7b1bfb84dd7412b3355040cd4829b5367c9239dd0adb')

package() {
  install -Dm644 "firefox-bitwarden-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}


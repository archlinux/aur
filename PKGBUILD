# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2025.10.0
_number=4599707
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices (binary release)"
url="https://addons.mozilla.org/addon/bitwarden-password-manager"
license=('GPL-3.0-only')
arch=('any')
depends=('firefox')
conflicts=("$_pkgname")
provides=("$_pkgname")
groups=('firefox-addons')
noextract=("bitwarden_password_manager-$pkgver.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/bitwarden_password_manager-$pkgver.xpi")
sha256sums=('31b88743f36032fa3cfb78e0582fb732ef00a3c5915182ba37fd08b04aac1d3b')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/firefox/firefox/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

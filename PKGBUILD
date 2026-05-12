# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2026.3.0
_number=4749958
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
sha256sums=('2dc6d074d4dc0abd2a8966f5065a55e7252bbf5e54b23c31dbedabfac0d4dbc4')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/firefox/firefox/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

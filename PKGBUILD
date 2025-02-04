# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2024.12.4
_number=4410896
pkgrel=2
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
sha256sums=('fad085bb5aadc852088b2d2da666ed182575e74e47848d40180e25b89ec70cb3')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/firefox/firefox/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

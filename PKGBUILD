# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2024.12.4
_number=4410896
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
sha256sums=('2c59e7040749dee010b34fb2a9c24b28ada71ad7fa5a23264ff70e63f8f686d1')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/firefox/firefox/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

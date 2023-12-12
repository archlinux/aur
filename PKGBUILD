# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2023.12.0
pkgrel=1
pkgdesc='A secure and free password manager for all of your devices (binary release)'
url="https://addons.mozilla.org/addon/bitwarden-password-manager"
arch=('any')
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('librewolf')
groups=('librewolf-addons')
noextract=("bitwarden_password_manager-$pkgver.xpi")
_number=4205620
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/bitwarden_password_manager-$pkgver.xpi")
sha256sums=('e76cc68f7f194b52f615ec9df80f82308cd55e6234afff5fb41ee7de9f7a27f2')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

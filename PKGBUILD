# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2023.9.1
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
_number=4140393
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/bitwarden_password_manager-$pkgver.xpi")
sha256sums=('46d4fe10ea3a1757a6a4c0d728f3f765d93883f742a3ebb73f36aeb80eec55a9')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

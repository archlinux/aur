# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-bitwarden
pkgname=$_pkgname-bin
pkgver=2023.12.1
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
_number=4211087
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/bitwarden_password_manager-$pkgver.xpi")
sha256sums=('40f695fbe5153a7614f25289a9388f95c59a952fb039b8b9c33fd7bd99ea2da2')

package() {
  install -Dm644 bitwarden_password_manager-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

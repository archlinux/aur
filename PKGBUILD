# Maintainer: Proton Technologies AG (ProtonMail Bridge developers) <bridge@protonmail.ch>
_pkgname=protonmail-bridge
pkgname=$_pkgname-beta-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="The Bridge is an application that runs on your computer in the background and seamlessly encrypts and decrypts your mail as it enters and leaves your computer."
arch=("x86_64")
url="https://www.protonmail.com/bridge"
license=("GPLv3")
depends=( 'qt5-base' 'qt5-multimedia' 'libsecret' 'ttf-dejavu' )
optdepends=( 'pass: pass support' 'gnome-keyring: gnome-keyring support')
conflicts=("$_pkgname" "$_pkgname-bin")
provides=("$_pkgname")
source=("https://protonmail.com/download/protonmail-bridge_1.2.7-1_amd64.deb")
sha256sums=("2ed3d699af65ba61def5440597eee58165c5e0b72926bac8cd99d0e976d2b327")

package() {
  tar -xJC "$pkgdir" -f data.tar.xz
  rm -rf "$pkgdir/opt"
}

# Maintainer: Proton Technologies AG (ProtonMail Bridge developers) <bridge@protonmail.ch>
_pkgname=protonmail-import-export-app
pkgname=$_pkgname-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="The Import-Export app helps you to migrate your emails from local files or remote IMAP servers to ProtonMail or simply export emails to local folder."
arch=("x86_64")
url="https://protonmail.com/import-export"
license=("GPLv3")
depends=( 'qt5-base' 'qt5-multimedia' 'libsecret' 'ttf-dejavu' )
optdepends=( 'pass: pass support' 'gnome-keyring: gnome-keyring support')
conflicts=("$_pkgname" "$_pkgname-beta-bin")
provides=("$_pkgname")
source=("https://protonmail.com/download/ie/protonmail-import-export-app_${pkgver}-1_amd64.deb")
sha256sums=("f9d4a2c2ce956c6561e0a0136bd8a74c6fc9d7808772c5bf8fa78567c9e0e0cd")

package() {
  tar -xJC "$pkgdir" -f data.tar.xz
  rm -rf "$pkgdir/opt"
}

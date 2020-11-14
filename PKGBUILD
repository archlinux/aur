# Maintainer: Proton Technologies AG (ProtonMail Bridge developers) <bridge@protonmail.ch>
_pkgname=protonmail-import-export-app
pkgname=$_pkgname-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="The Import-Export app helps you to migrate your emails from local files or remote IMAP servers to ProtonMail or simply export emails to local folder."
arch=("x86_64")
url="https://www.protonmail.com/ie"
license=("GPLv3")
depends=( 'qt5-base' 'qt5-multimedia' 'libsecret' 'ttf-dejavu' )
optdepends=( 'pass: pass support' 'gnome-keyring: gnome-keyring support')
conflicts=("$_pkgname" "$_pkgname-beta-bin")
provides=("$_pkgname")
source=("https://protonmail.com/download/ie/protonmail-import-export-app_1.1.2-1_amd64.deb")
sha256sums=("8c08e5dd2f0f60bd2fedf552c9fbb11bf00a5927848844eb9e2fc50295b1f573")

package() {
  tar -xJC "$pkgdir" -f data.tar.xz
  rm -rf "$pkgdir/opt"
}

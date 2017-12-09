# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=gnome-shell-extension-gsconnect
pkgver=7
pkgrel=1
pkgdesc="AppIndicator/KStatusNotifierItem support for GNOME Shell"
arch=('any')
url="https://github.com/ubuntu/gnome-shell-extension-appindicator"
license=('GPL')
makedepends=('unzip')
depends=('gnome-shell')
optdepends=(
  'sshfs: Browse remote files'
  'folks: Contacts integration (Evolution)'
  'libgdata: Contacts integration (GNOME Online Accounts)'
  'python2-nautilus: Nautilus integration'
  'gsound: Themed sound effects'
)
source=("https://github.com/andyholmes/$pkgname/releases/download/v$pkgver/gsconnect.andyholmes.github.io.zip")
noextract=('gsconnect.andyholmes.github.io.zip')
sha256sums=('781886ff8d55ae65cf584cf9dfd5567ba03903916c76bda54d8aaf31ea402f8b')

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
  unzip -q "$srcdir/gsconnect.andyholmes.github.io.zip" -d "$pkgdir/usr/share/gnome-shell/extensions/gsconnect@andyholmes.github.io"
}


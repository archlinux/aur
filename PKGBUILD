# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=gnome-shell-extension-gsconnect
pkgver=10
pkgrel=2
pkgdesc="KDE Connect implementation with GNOME Shell integration"
arch=('any')
url="https://github.com/andyholmes/gnome-shell-extension-gsconnect"
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
source=("$pkgname-$pkgver.zip::https://github.com/andyholmes/$pkgname/releases/download/v$pkgver/gsconnect.andyholmes.github.io.zip")
noextract=('$pkgname-$pkgver.zip')
sha256sums=('5d90c070f83d0578d655ac95e13aeb9fb99f72074ca6ea489898a800b42032ef')

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
  unzip -q "$srcdir/$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/gnome-shell/extensions/gsconnect@andyholmes.github.io"
}


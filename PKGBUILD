# Maintainer: Pavel Horniak <gouster4@gmail.com>
pkgname=technic-launcher
pkgver=v4.666
pkgrel=1
pkgdesc='The Technic Launcher will get you playing your favorite minecraft modpacks in no time. Choose from thousands of modpacks and install them with a single click.

Offline (LAN) version'
arch=('x86_64')
license=('GPL3')
url="https://www.technicpack.net/"
depends=('jre8-openjdk')
source=("git://github.com/Gouster4/AUR.git#branch=technic-launcher")
md5sums=('SKIP')
build() {
   echo "copyring files..."
}

package(){
  # Moving everything to pkg/.
  mkdir "$pkgdir"/usr "$pkgdir"/usr/lib "$pkgdir"/usr/bin "$pkgdir"/usr/share "$pkgdir"/usr/share/applications "$pkgdir"/usr/share/icons
  mv "$srcdir"/AUR/technic-launcher "$pkgdir"/usr/bin/technic-launcher
  chmod +x "$pkgdir"/usr/bin/technic-launcher
  mv "$srcdir"/AUR/technic.jar "$pkgdir"/usr/lib/technic.jar
  mv "$srcdir"/AUR/technic.desktop "$pkgdir"/usr/share/applications/technic.desktop
  mv "$srcdir"/AUR/technic.png "$pkgdir"/usr/share/icons/technic.png
}


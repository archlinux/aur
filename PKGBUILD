# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.4.6
pkgrel=1
pkgdesc="A simple Discord bot which can play music from YouTube or local files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/Blizcord/"
license=('mit')
depends=('jre8-openjdk')
install=$pkgname.install
source=("Blizcord.exe::https://github.com/Bleuzen/Blizcord/releases/download/${pkgver}/Blizcord.exe"
        "blizcord.png::https://raw.githubusercontent.com/Bleuzen/Blizcord/master/src/icon.png"
        "blizcord"
        "blizcord-gui"
        "blizcord.desktop")
md5sums=('f6983b916806c354196e2a8c16299bcb'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("Blizcord.exe")

package() {
  mkdir -p "$pkgdir"/opt/Blizcord/
  mkdir -p "$pkgdir"/usr/share/pixmaps/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/applications/

  install -D Blizcord.exe "$pkgdir"/opt/Blizcord/
  install -D blizcord.png "$pkgdir"/usr/share/pixmaps/
  install -D blizcord "$pkgdir"/usr/bin/
  install -D blizcord-gui "$pkgdir"/usr/bin/
  install -D blizcord.desktop "$pkgdir"/usr/share/applications/
}

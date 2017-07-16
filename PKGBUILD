# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.4.5
pkgrel=1
pkgdesc="A simple Discord bot which can play music from YouTube or local files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/Blizcord/"
license=('mit')
depends=('jre8-openjdk')
install=$pkgname.install
source=("Blizcord.exe::https://github.com/Bleuzen/Blizcord/releases/download/${pkgver}/Blizcord.exe"
        "blizcord"
        "blizcord-gui"
        "blizcord.desktop")
md5sums=('ee0cf6e348e1f750d3eeee64518f1e44'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("Blizcord.exe")

package() {
  mkdir -p "$pkgdir"/opt/Blizcord/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/applications/

  install -D Blizcord.exe "$pkgdir"/opt/Blizcord/
  install -D blizcord "$pkgdir"/usr/bin/
  install -D blizcord-gui "$pkgdir"/usr/bin/
  install -D blizcord.desktop "$pkgdir"/usr/share/applications/
}

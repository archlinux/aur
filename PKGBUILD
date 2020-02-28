# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.10.0
pkgrel=4
pkgdesc="A simple Discord bot which can play music from YouTube or local files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/Blizcord/"
license=('mit')
depends=('java-runtime>=11')
install=$pkgname.install
source=("Blizcord.exe::https://github.com/Bleuzen/Blizcord/releases/download/v${pkgver}/Blizcord.exe"
        "blizcord.png"
        "blizcord"
        "blizcord-gui"
        "blizcord.desktop")
sha256sums=('c13842907e49427a69eb2541a10650aeda69946f835a29ef6bc03f1366a80e4e'
          '82b7dbc3808620fd6ee63ce72db42d7eedd6e5d2e8325d2d455fe1bbb544823a'
          '7af19a60302ac1aeb7487cb68a6940775c646504aac7de1037faef8c37965d45'
          'b215434fdf48b4ed94094d7ad59b01500b9b15715eb1589aa459e68cfa6e2314'
          'f59ba104fb5cefb57a4714c1e959df66958d2a31af41ffbfdba8abe7f7a7bbf3')
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

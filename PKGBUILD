# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple Discord bot which can play music from YouTube or local files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/Blizcord/"
license=('mit')
depends=('jre8-openjdk')
install=$pkgname.install
source=("Blizcord.exe::https://github.com/Bleuzen/Blizcord/releases/download/${pkgver}/Blizcord.exe"
        "blizcord.png"
        "blizcord"
        "blizcord-gui"
        "blizcord.desktop")
sha256sums=('1d2cc20a03daca817bf9a6817eb55333e7b4872e2876bc2fc38b0abd23705a87'
          '82b7dbc3808620fd6ee63ce72db42d7eedd6e5d2e8325d2d455fe1bbb544823a'
          'f1e4d3bd71d1e365ed08a0c1167dff7a18f14111fff0a64ef0415e670ba2ca31'
          '48dfdffa48caec781381bcd9d65613453d558d238e53130b981567f55bd11f36'
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

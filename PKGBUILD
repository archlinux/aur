# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.10.1
pkgrel=1
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
sha256sums=('9d7e1e217702aac9a9eb104191e4ed6b466bf902f14d93bc060dd8e7a2e3933f'
          '82b7dbc3808620fd6ee63ce72db42d7eedd6e5d2e8325d2d455fe1bbb544823a'
          '3d1545c575b51962b3b9488c96145949a4cd691fed6774f40ea989d7abda9530'
          '500805644de6fa4fc1c15dbec602af950348498c86e7fb61b8e14200c63006bd'
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

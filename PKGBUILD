# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=blizcord
pkgver=0.8.7
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
sha1sums=('73ecf201dfb3f7702a5440edf2ac32ca3319225c'
          '81c66804e05785b0879d75792e488edc3aa8c438'
          '2a1a0b098dbf6817c61b55dc6338e795dda3f4d0'
          'f65b8c9e51ab2d3e6dbaec8eba12f19853e17298'
          '72cc07f74c090227434cf0050eef703b9954b397')
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

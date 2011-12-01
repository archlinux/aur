# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=minecraft-save-seed-reader
pkgver=1.6.1
pkgrel=1
pkgdesc='Allows you to toggle the game mode of Minecraft worlds/saves.'
arch=(any)
url='http://www.minecraftforum.net/topic/612625-pc-mac-linux10-minecraft-save-seed-reader-161-now-includes-hardcore-toggle/'
license=('BSD')
depends=('java-runtime')
optdepends=('minecraft: The game whose files this program modifies')
changelog=ChangeLog
source=(minecraft-save-seed-reader
       'https://github.com/downloads/thedarkfreak/Minecraft-Save-Seed-Reader/MinecraftSeed.zip')
md5sums=('f103f56c33d74318ac25cf5de8ecc541'
         '62d3a02d976a591d967d42b097e4de31')

package() {
  cd "$srcdir"

  install -Dm755 "minecraft-save-seed-reader" "$pkgdir/usr/bin/minecraft-save-seed-reader"
  install -Dm644 "MinecraftSeed.jar" "$pkgdir/usr/share/$pkgname/MinecraftSeed.jar"
  install -Dm644 "README.txt" "$pkgdir/usr/share/docs/$pkgname/README.txt"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:

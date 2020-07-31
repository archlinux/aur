# Maintainer: Ethan Skinner (etskinner) <etskinner@gmail.com>
pkgname=spigot-plugin-luckperms
pkgver=$_pkgver+b$_buildver
_pkgver=5.1.84
_buildver=1143
pkgrel=1
pkgdesc="An advanced permissions plugin for Bukkit/Spigot, BungeeCord and Sponge."
arch=(any)
url="https://github.com/lucko/LuckPerms"
license=("MIT")
depends=("craftbukkit>=1.8.0")
source=("https://ci.lucko.me/job/LuckPerms/$_buildver/artifact/bukkit/target/LuckPerms-Bukkit-$_pkgver.jar")
noextract=("LuckPerms-Bukkit-$_pkgver.jar")
sha256sums=('SKIP')

package() {
  install -Dm644 LuckPerms-Bukkit-$_pkgver.jar "$pkgdir/srv/craftbukkit/plugins/LuckPerms-Bukkit.jar"
  chown craftbukkit:craftbukkit $pkgdir/srv/craftbukkit/plugins/LuckPerms-Bukkit.jar
}

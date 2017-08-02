# Maintainer: Ethan Skinner (etskinner) <etskinner@gmail.com>
pkgname=spigot-plugin-luckperms
pkgver=3.2.62
pkgrel=1
pkgdesc="An advanced permissions plugin for Bukkit/Spigot, BungeeCord and Sponge."
arch=(any)
url="https://github.com/lucko/LuckPerms"
license=("MIT")
depends=("craftbukkit>=1.7.9")
source=("https://ci.lucko.me/job/LuckPerms/lastSuccessfulBuild/artifact/bukkit/target/LuckPerms-Bukkit-$pkgver.jar")
noextract=("LuckPerms-Bukkit-$pkgver.jar")
sha256sums=('3CA94526CCCC12E871C56114E1768DC05F734F27E118ED17751C7C48815DE53C')

package() {
  install -Dm644 LuckPerms-Bukkit-$pkgver.jar "$pkgdir/srv/craftbukkit/plugins/LuckPerms-Bukkit.jar"
  chown craftbukkit:craftbukkit $pkgdir/srv/craftbukkit/plugins/LuckPerms-Bukkit.jar
}

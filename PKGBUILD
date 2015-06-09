pkgname=spigot-plugin-essentials
pkgver=2.x
pkgrel=1
pkgdesc="Essentials offers about 100 commands useful on just about every server, from kits to mob spawning."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials"
license=("GPLv3")
depends=("craftbukkit>=1.8")
source=("https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/Essentials/target/Essentials-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsAntiBuild/target/EssentialsAntiBuild-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsChat-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsGeoIP-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsProtect/target/EssentialsProtect-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsSpawn-$pkgver-SNAPSHOT.jar"
"https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsXMPP/target/EssentialsXMPP-$pkgver-SNAPSHOT.jar")
noextract=("Essentials-$pkgver-SNAPSHOT.jar"
"EssentialsAntiBuild-$pkgver-SNAPSHOT.jar"
"EssentialsChat-$pkgver-SNAPSHOT.jar"
"EssentialsGeoIP-$pkgver-SNAPSHOT.jar"
"EssentialsProtect-$pkgver-SNAPSHOT.jar"
"EssentialsSpawn-$pkgver-SNAPSHOT.jar"
"EssentialsXMPP-$pkgver-SNAPSHOT.jar")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir"
  find . -name '*.jar' -exec install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{} \;
}

# vim:set ts=2 sw=2 et:

pkgname=spigot-plugin-essentials
epoch=1
pkgver=2.0.1
pkgrel=2
pkgdesc="Essentials offers about 100 commands useful on just about every server, from kits to mob spawning."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/essentials"
license=("GPLv3")
depends=("craftbukkit>=1.9")
source=("http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsAntiBuild/target/EssentialsXAntiBuild-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsXChat-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsXGeoIP-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsProtect/target/EssentialsXProtect-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsXSpawn-$pkgver.jar"
"http://ci.drtshock.net/job/essentialsx/lastSuccessfulBuild/artifact/EssentialsXMPP/target/EssentialsXXMPP-$pkgver.jar")
noextract=("EssentialsX-$pkgver.jar"
"EssentialsXAntiBuild-$pkgver.jar"
"EssentialsXChat-$pkgver.jar"
"EssentialsXGeoIP-$pkgver.jar"
"EssentialsXProtect-$pkgver.jar"
"EssentialsXSpawn-$pkgver.jar"
"EssentialsXXMPP-$pkgver.jar")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir"
  find . -name '*.jar' -exec install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{} \;
}

# vim:set ts=2 sw=2 et:

# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dexpatcher
pkgver=1.6.2
pkgrel=1
pkgdesc="Modify Android DEX/APK files at source-level using Java"
arch=('any')
url="http://forum.xda-developers.com/showthread.php?t=3060854"
license=('GPL3')
depends=('cfr' 'dex2jar' 'android-apktool')
source=("https://github.com/DexPatcher/dexpatcher-tool/releases/download/v$pkgver/$pkgname-$pkgver.jar"
        dexpatcher)
noextract=("$pkgname-$pkgver.jar")
sha256sums=('d528deff6775422280483df2822e21a8380c5aa5ea9841964e3b23fc5ae17f68'
            'b1f4274e7d89b66dc1ce4f314148544ccf37e6e9821454b456ec20b73fd44e49')

package() {
	install -D dexpatcher "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}

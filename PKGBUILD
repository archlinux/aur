# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dexpatcher
pkgver=1.2.0b2
_urlver=1.2.0-beta2
pkgrel=1
pkgdesc="Modify Android DEX/APK files at source-level using Java"
arch=('any')
url="http://forum.xda-developers.com/showthread.php?t=3060854"
license=('GPL3')
depends=('cfr' 'dex2jar' 'android-apktool')
source=("https://github.com/Lanchon/DexPatcher-tool/releases/download/v$_urlver/dexpatcher-$_urlver.jar"
        dexpatcher)
noextract=("dexpatcher-$pkgver.jar")
sha256sums=('ead8f04c601b4179dfbe1780c2b8b7fc8dd26039244a3b226db1bff07e294060'
            'b1f4274e7d89b66dc1ce4f314148544ccf37e6e9821454b456ec20b73fd44e49')

package() {
	install -D dexpatcher "$pkgdir/usr/bin/dexpatcher"
	install -Dm644 "dexpatcher-$pkgver.jar" "$pkgdir/usr/share/java/dexpatcher/dexpatcher.jar"
}

# Maintainer: Twann <twann@ctemplar.com>

pkgname=tlauncher-bin
pkgver=2.831
pkgrel=1
pkgdesc="TLauncher – The best Minecraft Launcher."
url="https://tlauncher.org"
arch=("any")
license=("custom")
depends=("java8-openjfx" "jdk8-openjdk" "jre8-openjdk" "jre8-openjdk-headless")
source=("${pkgname}-${pkgver}.zip::https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-${pkgver}.zip" "tlauncher.desktop")
sha512sums=("c1a628db7d65572195173791316c210731eb5206bd0d19e5abf2f083897fa4aa9d15517aff3e438d5a3bb6c9615704a8ca1a193c5ee68165d6862a28e52de795" "179d2229b4a0c72e8a02f2373e0ff33daf03afa05db5b5b96b115d1d5df7a3c8f7815bb25cae22a48b15b57d5c466a0bb314367926ea3bfc7a41ad12be7c3c55")

package()
{
        cd "$srcdir"
	install -Dm644 "$srcdir/TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/tlauncher.jar"
	install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
}

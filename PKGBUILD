# Maintainer: Twann <twann@ctemplar.com>

pkgname=tlauncher-bin
pkgver=2.83
pkgrel=4
pkgdesc="TLauncher – The best Minecraft Launcher."
url="https://tlauncher.org"
arch=("any")
license=("custom")
depends=("java8-openjfx" "jdk8-openjdk" "jre8-openjdk" "jre8-openjdk-headless")
source=("${pkgname}-${pkgver}.zip::https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-${pkgver}.zip" "tlauncher.desktop")
sha512sums=("edd828a80dc3c739e928256b0d0423545ea88a9074c9e0a8937ab1e6dae7b8d586322e301f5334f29bf4925916d285c6b120e95c2536de578d6806689e78b641" "179d2229b4a0c72e8a02f2373e0ff33daf03afa05db5b5b96b115d1d5df7a3c8f7815bb25cae22a48b15b57d5c466a0bb314367926ea3bfc7a41ad12be7c3c55")

package()
{
        cd "$srcdir"
	install -Dm644 "$srcdir/TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/tlauncher.jar"
	install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
}

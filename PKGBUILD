# Maintainer: Twann <twann@ctemplar.com>

pkgname=tlauncher-bin
pkgver=2.82
pkgrel=1
provides=("tlauncher" "minecraft")
pkgdesc="TLauncher Legacy is freeware launcher of Minecraft."
url="https://tlauncher.org"
arch=("x86_64")
license=("custom")
depends=("java8-openjfx" "jdk8-openjdk" "jre8-openjdk" "jre8-openjdk-headless")
source=("${pkgname}-${pkgver}::https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-${pkgver}.zip" "tlauncher.desktop")
sha512sums=("f0a2c4824ee2bd645c3112e66a1aa6a3a84e32cf4fadc6501aeea0b8adea160cfb2df33bf335a25c94abfef3061d1d706ad045f59dd0607dcae3044be4a33a71" "179d2229b4a0c72e8a02f2373e0ff33daf03afa05db5b5b96b115d1d5df7a3c8f7815bb25cae22a48b15b57d5c466a0bb314367926ea3bfc7a41ad12be7c3c55")

package()
{
        cd "$srcdir"
	install -Dm644 "$srcdir/TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/tlauncher.jar"
	install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
}

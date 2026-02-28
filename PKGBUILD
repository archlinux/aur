pkgname=cristalix
pkgver=1.1
pkgrel=1
pkgdesc="Cristalix Launcher"
arch=('x86_64')
url='https://cristalix.gg'
license=('custom')
depends=('jre8-openjdk' 'jdk17-openjdk' 'jdk21-openjdk')
source=(
    "https://cristalix.gg/content/launcher/Cristalix.jar"
    "Cristalix.desktop"
    "Cristalix.png"
)
noextract=("Cristalix.jar")
sha256sums=(
    'SKIP'
    'a281ca9e806bb440677be9e5bf267cbe7dce68f9a2fe303f715f753a27bd3cd4'
    'e8e58bbf9a1047e5b65b33ed9503e9bea2e13841109bc235cdf0b253fb55225b'
)

package() {
    install -Dm755 "$srcdir/Cristalix.jar" "$pkgdir/usr/bin/Cristalix.jar"
    install -Dm644 "$srcdir/Cristalix.desktop" "$pkgdir/usr/share/applications/Cristalix.desktop"
    install -Dm644 "$srcdir/Cristalix.png" "$pkgdir/usr/share/pixmaps/Cristalix.png"
}
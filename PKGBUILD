pkgname=cristalix
pkgver=1.0
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
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/Cristalix.jar" "$pkgdir/usr/bin/Cristalix.jar"
    install -Dm644 "$srcdir/Cristalix.desktop" "$pkgdir/usr/share/applications/Cristalix.desktop"
    install -Dm644 "$srcdir/Cristalix.png" "$pkgdir/usr/share/pixmaps/Cristalix.png"
}
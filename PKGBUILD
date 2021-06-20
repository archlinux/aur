# Maintainer: Sarisan <sekoohaka.sarisan@gmail.com>
pkgname=tl-launcher
pkgver=1.122.9
pkgrel=1
pkgdesc="One of the best simple Minecraft launchers"
arch=('x86_64')
url="http://tlaun.ch/"
license=('custom')
depends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'zlib' 'java-runtime' 'xorg-xrandr')
optdepends=('flite: narrator support')
source=(
    'tl-launcher.jar::http://tlaun.ch/jar'
    'tl-launcher.desktop'
    'tl-launcher.svg::https://launcher.mojang.com/download/minecraft-launcher.svg'
)
sha256sums=(
    'c2b52693f512b3b89afd52e1e5e6111c0cb1e7dcf95d8ae47be3fd793b9f8f98'
    'SKIP'
    'SKIP'
)

package () {
    cd "$pkgdir"

    install -Dm644 "$srcdir/tl-launcher.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/tl-launcher.svg"
    install -Dm644 "$srcdir/tl-launcher.desktop" "$pkgdir/usr/share/applications/tl-launcher.desktop"
    install -Dm755 "$srcdir/tl-launcher.jar" "$pkgdir/usr/lib/tl-launcher/tl-launcher.jar"
}

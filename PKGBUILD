# Maintainer: Owen Feldman <owen@ericfeldman.com>

pkgname=untitled-minecraft-launcher-bin
pkgver=0.1.0
pkgrel=1
install=untitled-minecraft-launcher-bin.install
pkgdesc="A terminal-based Minecraft launcher for Linux, written in Rust"
arch=('x86_64')
url="https://uml.rs"
license=('Unlicense')
depends=('jre-openjdk')
provides=('uml')
conflicts=('uml')
source=("$pkgname-$pkgver.tar.gz::https://gitea.owendeed.com/Toasterkitten/untitled-minecraft-launcher/releases/download/v$pkgver/uml-x86_64-linux.tar.gz")
sha256sums=('cc5fdb3e6e43b1812efc7f50e37186b84832b69436615c8b89ac36c32126bd06')

package() {
    install -Dm755 "$srcdir/uml" "$pkgdir/usr/bin/uml"
}

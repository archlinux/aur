# Maintainer: Owen Feldman <owen@ericfeldman.com>

pkgname=untitled-minecraft-launcher-bin
pkgver=0.3.0
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
sha256sums=('2e2ca49f51c887fc6dcdb97f07bb3f36c3bf2885603e76a1cb4ded755b49a1b6')

package() {
    install -Dm755 "$srcdir/uml" "$pkgdir/usr/bin/uml"
}

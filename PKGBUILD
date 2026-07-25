# Maintainer: Owen Feldman <owen@ericfeldman.com>

pkgname=untitled-minecraft-launcher-bin
pkgver=0.2.0
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
sha256sums=('38089c0349e33c05681a799d623c151dff2ffcf4e053cf86441c2ad687192c5c')

package() {
    install -Dm755 "$srcdir/uml" "$pkgdir/usr/bin/uml"
}

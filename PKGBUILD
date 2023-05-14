# Maintainer: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=19
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=("GPL")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=("9c0f23068b792a4d6239195db37bcc757ecf5c7e62ae5bfc8b19008957817b1c04b1ea4fadbb594a033586333c6f03491d6a786f0831f811aad46c220654ac04")

package() {
    install -d "$pkgdir/usr/share/gnome-shell/extensions"
    cp -a "$srcdir/Resource_Monitor-$pkgver/Resource_Monitor@Ory0n/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}

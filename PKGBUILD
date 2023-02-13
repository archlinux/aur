# Maintainer: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=18
pkgrel=2
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=("GPL")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=("b2298f819a6af352b93719c1bcd77b778e6ff953b0623d7d7e9740420b7827684b9b878ea0cdb9badf2104fd6e02eee3f6c99581b309b863988eca83787c401e")

package() {
    install -d "$pkgdir/usr/share/gnome-shell/extensions"
    cp -a "$srcdir/Resource_Monitor-$pkgver/Resource_Monitor@Ory0n/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}

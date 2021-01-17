# Maintainer: Ziarnova

pkgname=gnome-shell-extension-resource-monitor
pkgver=10
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=("GPL")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/10.tar.gz")
sha512sums=("62562bdceeb2e69336d705cdbdbc91ed0181ceb35fd042b29fb933dcc4cfb43cfc518f3995a361359ef9b4e77f70bcc72f3503c5ebf7ce2c063642aa23889f0e")

package() {
install -d "$pkgdir/usr/share/gnome-shell/extensions"
cp -a "$srcdir/Resource_Monitor-$pkgver/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}

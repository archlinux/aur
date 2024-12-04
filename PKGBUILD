# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=25
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=("GPL")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b5e699d11282177b17e2353d826bb58dba218477f2d26bfa2f124e6051baa917e5b6ee964cbd8ce24f917efa53b9943077abfd5d0cddd019dd1b71cc3ba95fe7')

package() {
    install -d "$pkgdir/usr/share/gnome-shell/extensions"
    cp -a "$srcdir/Resource_Monitor-$pkgver/Resource_Monitor@Ory0n/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}

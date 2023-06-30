# Maintainer: Kimiblock Moe <pn3535@icloud.com>

pkgname=librewolf-gnome-search-provider
pkgver=1
pkgrel=1
pkgdesc="GNOME shell search provider for LibreWolf (Based on firefox-gnome-search-provider)"
arch=(any)
license=(GPL3)
depends=('librewolf')
source=(librewolf-search-provider.ini)
sha256sums=('914e023463ce7f818540552f29a7420bba6da4133dfbee8815baeed24725ad0f')
install=librewolf-gnome-search-provider.install

package() {
 install -Dm644 librewolf-search-provider.ini -t "$pkgdir"/usr/share/gnome-shell/search-providers
}

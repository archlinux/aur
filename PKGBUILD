# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=firefox-gnome-search-provider
pkgver=1
pkgrel=1
pkgdesc="GNOME shell search provider for Firefox (search inside Firefox from activities view)"
arch=(any)
license=(GPL3)
depends=('firefox')
source=(firefox-search-provider.ini)
sha256sums=('bd1552045fe32411cf1d0368c69735a95816cf1ddb32ea1a0059fd2f6a694f71')
install=firefox-gnome-search-provider.install

package() {
 install -Dm644 firefox-search-provider.ini -t "$pkgdir"/usr/share/gnome-shell/search-providers
}

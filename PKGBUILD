pkgname=desktime
pkgver=6.1.0
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

source=("$pkgname-$pkgver.deb::https://desktime.com/updates/electron/linux?deb")
md5sums=('f467184a4e04d6e2591f19a939148707')

package()
{
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

# vim:et:sw=4:sts=4

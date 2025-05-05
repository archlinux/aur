pkgname=desktime
pkgver=6.1.1
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

source=("$pkgname-$pkgver.deb::https://desktime.com/updates/electron/linux?deb")
md5sums=('e5eacbf6d05f4b516169b187dafa358f')

package()
{
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

# vim:et:sw=4:sts=4

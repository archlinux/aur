pkgname=desktime
pkgver=6.0.7
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

source=("$pkgname-$pkgver.deb::https://desktime.com/updates/electron/linux?deb")
md5sums=('ed8ef8704696c124da79da2176a54e5f')

package()
{
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

# vim:et:sw=4:sts=4

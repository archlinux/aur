pkgname=desktime
pkgver=6.0.0
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

source=("$pkgname-$pkgver.deb::https://desktime.com/updates/electron/linux?deb")
md5sums=('8d9fbf67074d1feec730c0983aeb3c46')

package()
{
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

# vim:et:sw=4:sts=4

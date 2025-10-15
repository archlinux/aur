pkgname=desktime
pkgver=6.1.2
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

source=("$pkgname-$pkgver.deb::https://desktime.com/updates/electron/linux?deb")
sha256sums=('0eb7513a6d644490a0af1d13b60bed602ec3ad7f0ef70da99545467c4640027e')

package()
{
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

# vim:et:sw=4:sts=4

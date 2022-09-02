pkgname=kernel-install-for-dracut
pkgver=1.4
pkgrel=1
pkgdesc='Enables systemd-boot automation using kernel-install with dracut'
arch=(any)
url="https://gitlab.com/dalto.8/${pkgname}"
license=(GPL2)
depends=(dracut)
conflicts=(mkinitcpio kernel-install-mkinitcpio)
backup=(etc/kernel/install.d/50-dracut.install)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1f34e8bf13af41f497d5da2b95f6f864dd39a3501fdf6e71935422525c44b41e')

package()
{
    # install the package files
    cp -a "${srcdir}"/${pkgname}-${pkgver}/src/{usr,etc} "${pkgdir}"
}

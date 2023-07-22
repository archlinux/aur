pkgname=kernel-install-for-dracut
pkgver=1.8
pkgrel=1
pkgdesc='Enables systemd-boot automation using kernel-install with dracut'
arch=(any)
url="https://gitlab.com/dalto.8/${pkgname}"
license=(GPL2)
depends=(dracut)
conflicts=(mkinitcpio kernel-install-mkinitcpio)
backup=(etc/kernel/install.d/50-dracut.install etc/kernel-install-for-dracut.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f69f072f53c28b2681f3b866f219e70f5ee10182847706338db664ff3d08404')

package()
{
    # install the package files
    cp -a "${srcdir}"/${pkgname}-${pkgver}/src/{usr,etc} "${pkgdir}"
}

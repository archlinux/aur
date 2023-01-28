pkgname=kernel-install-for-dracut
pkgver=1.7
pkgrel=1
pkgdesc='Enables systemd-boot automation using kernel-install with dracut'
arch=(any)
url="https://gitlab.com/dalto.8/${pkgname}"
license=(GPL2)
depends=(dracut)
conflicts=(mkinitcpio kernel-install-mkinitcpio)
backup=(etc/kernel/install.d/50-dracut.install etc/kernel-install-for-dracut.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3fd208a42d64cab5c519112d19ab905e812b54d012b962f7a7ebc4c0b1408239')

package()
{
    # install the package files
    cp -a "${srcdir}"/${pkgname}-${pkgver}/src/{usr,etc} "${pkgdir}"
}

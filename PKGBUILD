pkgname=kernel-install-for-dracut
pkgver=1.10.1
pkgrel=1
pkgdesc='Enables systemd-boot automation using kernel-install with dracut'
arch=(any)
url="https://gitlab.com/dalto.8/${pkgname}"
license=(GPL2)
depends=(dracut)
conflicts=(mkinitcpio kernel-install-mkinitcpio)
backup=(etc/kernel/install.d/50-dracut.install etc/kernel-install-for-dracut.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a409ebff3c869f99c79a6a3e68d3b2f7eddb893f1c4339a5a74af4684992fd7e')

package()
{
    # install the package files
    cp -a "${srcdir}"/${pkgname}-${pkgver}/src/{usr,etc} "${pkgdir}"
}

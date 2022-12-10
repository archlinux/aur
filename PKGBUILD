pkgname=kernel-install-for-dracut
pkgver=1.6
pkgrel=1
pkgdesc='Enables systemd-boot automation using kernel-install with dracut'
arch=(any)
url="https://gitlab.com/dalto.8/${pkgname}"
license=(GPL2)
depends=(dracut)
conflicts=(mkinitcpio kernel-install-mkinitcpio)
backup=(etc/kernel/install.d/50-dracut.install)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('892567aab63b5e3e30cf6a20896cb63bbae61e1ca615326b7052ed656db61aad')

package()
{
    # install the package files
    cp -a "${srcdir}"/${pkgname}-${pkgver}/src/{usr,etc} "${pkgdir}"
}

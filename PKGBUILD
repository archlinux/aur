pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.8
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('0299728b1c5da872ec09be290662cb215c9b5c465c43bd6cb79b147a24ee7d78dac525c812f3d46257179b054a04453208bbf77113930448bf90e5254a920bcc')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"
}

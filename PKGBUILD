pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.7
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('c881c139583111c26082953a208adc63168315a0a31b58f67e0c844bc26a968d0ded88636b3c13078a03b7d623f01f521cfaeda6ba7c0883ba13b9c34f8e149e')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"
}

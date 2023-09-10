pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.6
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('36edcbff7cb014d72ebe2855905858807d649b19ca9089d623f27667f0cd77264a7a6d032639b8761e1687b930d6c2efb3b23338e25e8c6441484735949ad044')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"
}

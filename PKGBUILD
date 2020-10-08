# Maintainer: Pinembour <pinembour@teppelin.fr>

pkgname=mkinitcpio-rbd
pkgver=1.1
pkgrel=1
pkgdesc="mkinitcpio hook to boot from Ceph Block Device"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/"
license=('BSD')
depends=('mkinitcpio-nfs-utils')
source=('mkinitcpio-rbd-install'
        'mkinitcpio-rbd-hook')
sha256sums=('f9f08c0281d478ff1eab2e0a73409496b4aa4f33181662d7cc296f5aa3aa9501'
            'b5b803e5c11065677bbbd2fc6da16429d9ebbd9ed9ca37ee80bffd335754c46d')

package() {
    install -Dm644 "$srcdir/mkinitcpio-rbd-install" "$pkgdir/usr/lib/initcpio/install/rbd"
    install -Dm644 "$srcdir/mkinitcpio-rbd-hook" "$pkgdir/usr/lib/initcpio/hooks/rbd"
}

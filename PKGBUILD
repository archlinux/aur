# Maintainer: Czémán Arnold <cemiarni@gmail.com>

pkgname=mkinitcpio-rbd
pkgver=1.0
pkgrel=1
pkgdesc="mkinitcpio hook to boot from Ceph Block Device"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/"
license=('BSD')
depends=('mkinitcpio-nfs-utils')
source=('mkinitcpio-rbd-install'
        'mkinitcpio-rbd-hook')
sha256sums=('e0776a11ae9b46d9ae31607fe45e387795a8587d2221de2693702205f85a266a'
            '43a141db5d0f68e3f1a89e2e7ee01767d5f915b5096f88f694bc397052f68b8e')

package() {
    install -Dm644 "$srcdir/mkinitcpio-rbd-install" "$pkgdir/usr/lib/initcpio/install/rbd"
    install -Dm644 "$srcdir/mkinitcpio-rbd-hook" "$pkgdir/usr/lib/initcpio/hooks/rbd"
}

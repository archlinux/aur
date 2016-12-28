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
        sha256sums=('4fd594e2a9aeacd84f592cfe81202529a3da973caaa018bb05a188ea1a187d57'
                    '9857159b7a5ca450369eda18fbbf20950f0e991df71bc69f99a83fea8bcb04e8')

package() {
    install -Dm644 "$srcdir/mkinitcpio-rbd-install" "$pkgdir/usr/lib/initcpio/install/rbd"
    install -Dm644 "$srcdir/mkinitcpio-rbd-hook" "$pkgdir/usr/lib/initcpio/hooks/rbd"
}

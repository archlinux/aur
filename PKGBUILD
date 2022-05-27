# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
pkgname=paclist
pkgver=r5
pkgrel=1
pkgdesc='pacman hook to make lists of installed packages.'
arch=(any)
backup=(etc/paclist/config)
source=(paclist.sh paclist.hook config)
sha256sums=('626d0e3d7ef574ec03a2eba3bb6e026c9ee95d1cd1b3c0ef8f86a3d5edeeef45'
            '87ce6f65a9b4a58457beaa0866ec86a1192d668920311969b5b78b5b76491b52'
            '470e9b2586fc67d2fde3908e395ce13895100ae1e177f3d6d185cbe4e9d57e15')

package() {
    install -vDm644 config "$pkgdir"/etc/paclist/config
    install -vDm755 paclist.sh "$pkgdir"/usr/share/libalpm/scripts/paclist
    install -vDm644 paclist.hook "$pkgdir"/usr/share/libalpm/hooks/paclist.hook
}

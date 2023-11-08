# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>


pkgname=vmangos-setupdb
pkgver=1.3
pkgrel=1
pkgdesc="Pacman hook to update vmangos databases in MariaDB"
arch=('x86_64')
license=('GPL2')
depends=(
    'vmangos-git'
    'mariadb'
)
source=(
    "80-vmangos-setupdb.hook"
    "vmangos-setupdb.sh"
)
sha256sums=('b90aaac3379eb242f6fd9e08225e3ee9e6eb4ec602590edabf450e9db90253f5'
            '027647f8b2907b82aadaeb288bb8c94587adf715766382a4bfd781f3ac93a300')

package() {
    install -Dm644 ${srcdir}/*.hook -t ${pkgdir}/usr/share/libalpm/hooks
    install -Dm755 ${srcdir}/*.sh -t ${pkgdir}/usr/share/libalpm/scripts
}

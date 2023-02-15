# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>


pkgname=vmangos-setupdb
pkgver=1.1
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
sha256sums=(
    'b90aaac3379eb242f6fd9e08225e3ee9e6eb4ec602590edabf450e9db90253f5'
    'dbfb947e8983879326062ffbeb1d4a2460ecaa4a3ce4079a1d7eab78894df5bf'
)

package() {
    install -Dm644 ${srcdir}/*.hook -t ${pkgdir}/usr/share/libalpm/hooks
    install -Dm755 ${srcdir}/*.sh -t ${pkgdir}/usr/share/libalpm/scripts
}

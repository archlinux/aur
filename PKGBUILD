# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>


pkgname=vmangos-setupdb
pkgver=1
pkgrel=2
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
    '7e64211a0d4e96f57c089957f40913e4e3575d5e0920d5058b6ef885620eadf3'
)

package() {
    install -Dm644 ${srcdir}/*.hook -t ${pkgdir}/usr/share/libalpm/hooks
    install -Dm755 ${srcdir}/*.sh -t ${pkgdir}/usr/share/libalpm/scripts
}

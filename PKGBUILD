# Maintainer: beidl <dev.beidl@gmail.com>

pkgname=nemo-desktop-startup
pkgver=1
pkgrel=1
pkgdesc="Nemo desktop startup"
arch=('x86_64')
license=('GPL')
depends=('nemo' 'systemd')
source=("file://nemo-desktop.service"
        "file://nemo-desktop.desktop")
md5sums=('SKIP'
         'SKIP')

build() {
    echo "skip"
}

package() {
    echo "${pkgdir}"
    mkdir -p ${pkgdir}/etc/xdg/autostart/
    mkdir -p ${pkgdir}/usr/lib/systemd/user/
    cp ${srcdir}/nemo-desktop.desktop ${pkgdir}/etc/xdg/autostart/
    cp ${srcdir}/nemo-desktop.service ${pkgdir}/usr/lib/systemd/user/
}

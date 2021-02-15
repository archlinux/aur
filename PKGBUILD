# Maintainer: ANDRoid7890 <andrey.android7890@gmail.com>

pkgname=bootsplash-manager-bin
pkgver=1.4
pkgrel=2
pkgdesc="Simple bootsplash manager"
url="https://github.com/ANDRoid7890/bootsplash-manager"
arch=(x86_64)
license=(GPL2)
depends=('qt5-base'
         'bootsplash-systemd'
         'polkit')
conflicts=('bootsplash-manager')

source=("https://github.com/ANDRoid7890/bootsplash-manager/releases/download/$pkgver/bootsplash-manager.tar.gz")

md5sums=('d7eddd4dfdab09e6c0e095c32155f97f')

package() {
    install -Dm755 bootsplash-manager "$pkgdir/usr/bin/bootsplash-manager"
    install -Dm755 bootsplash-manager-gui "$pkgdir/usr/bin/bootsplash-manager-gui"
    install -Dm644 org.manjaro.bootsplash-manager.policy "$pkgdir/usr/share/polkit-1/actions/org.manjaro.bootsplash-manager.policy"
    install -Dm644 bootsplash-manager-gui.svg "$pkgdir/usr/share/pixmaps/bootsplash-manager-gui.svg"
    install -Dm644 bootsplash-manager.desktop "$pkgdir/usr/share/applications/bootsplash-manager.desktop"
}

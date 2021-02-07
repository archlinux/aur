# Maintainer: ANDRoid7890 <andrey.android7890@gmail.com>

pkgname=bootsplash-manager-bin
pkgver=1.0
pkgrel=1
pkgdesc="Simple cli bootsplash manager"
url="https://github.com/ANDRoid7890/bootsplash-manager"
arch=(x86_64)
license=(GPL2)
depends=('qt5-base'
         'bootsplash-systemd')
makedepends=(cmake)

source=("https://github.com/ANDRoid7890/bootsplash-manager/releases/download/1.0/bootsplash-manager.tar.gz")

md5sums=('7f94cbeeaf2f1a11aa0c55d3c4a3bbdf')

package() {
    install -Dm755 bootsplash-manager "$pkgdir/usr/bin/bootsplash-manager"
    install -Dm644 org.manjaro.bootsplash-manager.policy "$pkgdir/usr/share/polkit-1/actions/org.manjaro.bootsplash-manager.policy"
}

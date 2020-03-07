# Maintainer: ccat3z <c0ldcat3z@gmail.com>

_release_ver='1.3.7-1-g5971615'

pkgname=mirror-sync
pkgver=1.3.7
pkgrel=1
pkgdesc="A tool for real-time, two-way sync for remote (e.g. desktop/laptop) development"
arch=("x86_64")
url="https://github.com/stephenh/mirror"
license=('APACHE')
depends=('jre8-openjdk-headless' 'watchman')
source=("https://github.com/stephenh/mirror/releases/download/${_release_ver}/mirror-all.jar"
        "mirror")
noextract=('mirror-all.jar')
sha256sums=('d65e6dce4576ca84f4e823d1640f9ad355bb7a79878194e0fd13e9530a426cfa'
            '026dde44b41c2f21d3cfe36ce957928f1f89bce18cf8bbea49f3407af7ed05a1')

package() {
    install -Dm 755 ./mirror $pkgdir/usr/bin/mirror
    install -Dm 755 ./mirror-all.jar $pkgdir/usr/share/java/mirror/mirror-all.jar
}

# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>

pkgname="rclone-mount-service"
pkgver=07032022
pkgrel=0
pkgdesc="Rclone systemd user service"
arch=('x86_64')
depends=('systemd' 'rclone')
source=('rclone@.service')
md5sums=('SKIP')

package() {
    install -Dm 0644 "$srcdir/rclone@.service" "$pkgdir/usr/lib/systemd/user/rclone@.service"
}

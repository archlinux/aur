# Maintainer: vgs vldmr.lshnk@gmail.com
pkgname=rclone-bisync-service
pkgver=20250923
pkgrel=1
pkgdesc="Systemd user service wrapper over rclone bisync. Rclone bisync is command that provide two side syncronization with offline access to files."
arch=('any')
depends=('systemd' 'rclone')
source=('rclone-bisync@.service' 'rclone-bisync@.path' 'rclone-bisync@.timer' 'rclone-bisync-init.sh')
md5sums=('SKIP')
license=('MIT')

package() {
    install -Dm "$src/rclone-bisync@.{service,timer,path}" "$pkgdir/usr/lib/systemd/user/rclone-bisync@.{service,timer,path}"
    install -Dm "$src/rclone-bisync-init.sh" "$pkgdir/usr/bin/rclone-bisync-init.sh"
}

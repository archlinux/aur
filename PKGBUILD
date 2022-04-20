pkgname=pacman-maintenance
pkgdesc=Perform pacman maintenance by timer
pkgver=0.0.1
pkgrel=1
license=('MIT-0')
arch=(any)
source=(https://github.com/droserasprout/$pkgname/archive/refs/heads/master.zip)
sha256sums=('SKIP')

package() {
    install -Dm644 $pkgname-master/$pkgname@.service "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
    install -Dm644 $pkgname-master/$pkgname@.timer "$pkgdir/usr/lib/systemd/system/$pkgname@.timer"
}
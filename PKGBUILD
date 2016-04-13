# Maintainer: Laurentiu Nicola <lnicola@dend.ro>
pkgname=systemd-zpool-scrub
pkgver=1.0
pkgrel=2
pkgdesc="Systemd service for automatic ZFS zpool scrubbing"
arch=('any')
url="https://github.com/lnicola/systemd-zpool-scrub"
license=('MIT')
depends=('zfs-utils')
source=("git+https://github.com/lnicola/systemd-zpool-scrub.git")
md5sums=('SKIP')

package() {
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname/zpool-scrub@.service" "$pkgdir/usr/lib/systemd/system/zpool-scrub@.service"
    install -Dm644 "$srcdir/$pkgname/zpool-scrub@.timer" "$pkgdir/usr/lib/systemd/system/zpool-scrub@.timer"
}

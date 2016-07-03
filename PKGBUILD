# Maintainer: Sebastian Schwarz <seschwar@gmail.com>
pkgname=beadm
pkgver=1.2.5
pkgrel=1
pkgdesc="Manage Boot Environments on ZFS filesystems"
arch=(any)
url=https://github.com/b333z/beadm
license=(BSD2)
depends=(awk sh zfs-utils)
backup=(etc/beadm.conf)
source=("$pkgname-$pkgver::https://github.com/b333z/beadm/archive/$pkgver.tar.gz")
md5sums=(67f7062af87915b0ee448cbc63567200)

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 beadm "$pkgdir/usr/bin/beadm"
    install -Dm0644 beadm.conf "$pkgdir/etc/beadm.conf"
    install -Dm0644 beadm.1 "$pkgdir/usr/share/man/man1/beadm.1"
}

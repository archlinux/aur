# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=ramroot
pkgver=2.1.0
pkgrel=1
pkgdesc='Load root filesystem to zram in early userspace'
arch=(any)
url="https://github.com/arcmags/$pkgname"
license=(GPL-3.0-or-later)
depends=(mkinitcpio)
backup=(etc/ramroot.conf etc/ramroot.z/etc/issue.d/ramroot.issue)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(6c1f91f844723eee19b672bfd526d5c35546bd8aa2e8d91895442fa4ee23f490)

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

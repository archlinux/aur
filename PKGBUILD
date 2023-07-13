# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=firefox-no-reserved-keys-patch
pkgver=1.1
pkgrel=1
pkgdesc='hot patch Firefox after install or update to un-reserve all key bindings'
arch=(any)
depends=(firefox pacman-contrib perl)
source=(firefox-no-reserved-keys-patch.hook)
sha256sums=('e15423376d7a19e43037918c2c7ee5d666c71bbba05ce12a9e68a257f8dd1462')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}

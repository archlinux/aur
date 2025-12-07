# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
# Contributor: 漓翎_cub
pkgname=hei-cursors-git
pkgver=0.r1.g0000000
pkgrel=6
pkgdesc="Hei Cursor Theme. Created by Bilibili user 1013625945 (漓翎_cub), ported by GitHub user Tseshongfeeshur (Ryan)."
arch=('any')
url="https://github.com/Tseshongfeeshur/hei-cursors"
license=('MIT')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hei-cursors"
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
}

package() {
    cd "$srcdir/hei-cursors"

    install -dm755 "$pkgdir/usr/share/icons/hei_cursors"
    cp -r * "$pkgdir/usr/share/icons/hei_cursors/"
}

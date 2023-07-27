# Maintainer: Froggo <froggo8311@proton.me>
pkgname=pawse
pkgver=1.0.0
pkgrel=1
pkgdesc="An easy way to keep programs running in the background"
arch=(any)
url="https://codeberg.org/Froggo/pawse"
license=('MIT')
depends=(python)
source=(
        pawse.py
)

sha256sums=(
        'SKIP'
)

package() {
        cd "$srcdir/"
        install -dm755 "$pkgdir/usr/bin"
        install -Dm755 "$srcdir/pawse.py" "$pkgdir/usr/bin/pawse"
}

# Maintainer: Sven Lechner <sven[dot]lechner[at]rwth-aachen[dot]de>

pkgname=act
pkgver=0.2.5
pkgrel=1
pkgdesc='Run your GitHub Actions locally'
arch=('x86_64')
url='https://github.com/nektos/act'
license=('MIT')
provides=('act')
conflicts=('act')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=('901ec8f2fff04f8564e31323486c4027eb5f1a4075612ad667609d87fac1455f')

package() {
    # Install binary.
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"

    # Install license.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Sven Lechner <sven[dot]lechner[at]rwth-aachen[dot]de>

pkgname=act
pkgver=0.1.3
pkgrel=1
pkgdesc='Run your GitHub Actions locally'
arch=('x86_64')
url='https://github.com/nektos/act'
license=('MIT')
provides=('act')
conflicts=('act')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/nektos/act/releases/download/v$pkgver/act_Linux_x86_64.tar.gz")
sha256sums=('2356dcc4ba6cba8735d2489f47d84793a7f13ffa0a6cd7d1895e48ddfc3835fc')

package() {
    # Install binary.
    install -Dm755 "$srcdir/act" "$pkgdir/usr/bin/act"

    # Install license.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

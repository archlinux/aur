# Maintainer: bashkonsole <bashkonsole@gmail.com>

pkgname=ksl-runner
pkgver=1.0
pkgrel=1
pkgdesc="KSL Runner — Recreate .bat files as .ksl scripts and run them through Konsole."
arch=('any')
url="https://github.com/bashkonsole/konsole"
license=('MIT')
depends=('qt6-base' 'konsole')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/konsole-$pkgver/install.sh" "$pkgdir/usr/bin/ksl-runner-install"
    install -Dm644 "$srcdir/konsole-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

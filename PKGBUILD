# Maintainer: Твое Имя <твой_email@example.com>
pkgname=alyafetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal fetch utility written in POSIX shell with Nerd Font icons"
arch=('any')
url="https://github.com/asyx-creator/alyafetch"
license=('MIT')
depends=('sh' 'ttf-jetbrains-mono-nerd')
makedepends=('git')
source=("$pkgname::git+https://github.com/asyx-creator/alyafetch.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname/alyafetch.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=superbirdjumper2
pkgver=2.4
pkgrel=1
pkgdesc="A fun game"
arch=('x86_64')
url="https://github.com/codyferd/superbirdjumper2"
license=('MIT')
depends=('glibc')
source=("https://github.com/codyferd/superbirdjumper2/releases/download/2.4Saimaa/superbirdjumper2_linux.x86_64")
sha256sums=('SKIP')  # Replace with real sha256sum

package() {
    install -Dm755 "$srcdir/superbirdjumper2_linux.x86_64" "$pkgdir/usr/bin/superbirdjumper2"
}

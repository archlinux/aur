# Maintainer: nicknb <nicknb at posteo dot com>
_name=motus
pkgname=$_name-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A dead simple password generator"
arch=("x86_64")
url="https://github.com/oleiade/motus"
license=("AGPL-3.0-only")
provides=($_name)
conflicts=($_name)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('186044ed15fce10d6210f33ebfa99487f22b61c3c3e8040427cd82b9e9caf042')

package() {
    install -Dm 0755 motus "$pkgdir/usr/bin/motus"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
    install -Dm 0644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
}

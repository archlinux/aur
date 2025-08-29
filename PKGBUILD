# Maintainer: nicknb <nicknb at posteo dot com>
_name=motus
pkgname=$_name-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A dead simple password generator"
arch=("x86_64")
url="https://github.com/oleiade/motus"
license=("AGPL-3.0-only")
provides=($_name)
conflicts=($_name)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9c18be6b36f3a160329e6f6e0228f48fb4301c575dfee6ad26aacf99ea0c35dd')

package() {
    install -Dm 0755 motus "$pkgdir/usr/bin/motus"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
    install -Dm 0644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
}

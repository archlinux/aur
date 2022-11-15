# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a5b0fdc416ba5b71288ccac20fc2f8b0116d1bd3be5492713dcd38b7ad691aec')
sha256sums_aarch64=('10ee3adb45718c27d7e944a8b4fe3427d2297490eac82a7ac3b6ab81a2a46ed6')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

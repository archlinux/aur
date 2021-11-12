# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fde02f5a1e8fcd8f7b0b4d734efdb72b08716428aa4471966a164a40a1635c22')
sha256sums_aarch64=('90b531acbf037a2b80bab8b64ef5d5b857fe62c615dc1c4d0d513842340aaf30')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

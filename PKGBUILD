# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_linux_x86_64_v${pkgver}.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_linux_arm64_v${pkgver}.tar.gz")
sha256sums_x86_64=('0e01428cd3c583d76d30efdfda197e6883a49c660da8a852e1c2bb36a384ea40')
sha256sums_aarch64=('27ac3c9a71c91a29c641f7dada834ecbf14f4d550ef1f6a2da2e8bddc89489a9')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

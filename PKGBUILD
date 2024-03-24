# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.7.4
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_linux_x86_64_v${pkgver}.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_linux_arm64_v${pkgver}.tar.gz")
sha256sums_x86_64=('acdc00a8577f2b3a718a41e87caef714e5833b4c12b09a9894b89c9b622019f2')
sha256sums_aarch64=('a11ea4ab16cc8413f034e7385fd42431bcfd6a282505ec33fed92f72732a4e42')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

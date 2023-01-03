# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8cc5781a817128acf3f375796a69ef8e98ee16e465491e0ac2942cad1d726a8d')
sha256sums_aarch64=('22a97ee9a6238ee3cff170ed2f92ceb1c05bff3631e889da97f9c3ace1355e96')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

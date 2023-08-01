# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.6.9
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_Linux_arm64.tar.gz")
sha256sums_x86_64=('7e8a76f3f59003f8a15634f94a7b902b55e0cec6363ee74db4175d7e9a4425fc')
sha256sums_aarch64=('68a1dec1e9ac946a9f5639e79ae5ff395b93ee2290017a0084fb577f000ec635')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
_name=crawley
pkgname=$_name-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="The unix-way web crawler"
arch=(x86_64 aarch64)
url="https://github.com/s0rg/crawley"
license=('MIT')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/crawley_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/crawley_Linux_arm64.tar.gz")
sha256sums_x86_64=('b7bf9ddcf0fd589058e48528e76bc960e919bc92c9625edc8e2495360430a686')
sha256sums_aarch64=('b71cc3e39c897818993d50b972732fd47d83a1f05ca3626b85c2ed8fb49aa787')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

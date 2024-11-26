# Maintainer: Firebleu <firebluedark@proton.me>
pkgname=autoinstallpackages
pkgver=3.3
pkgrel=1
pkgdesc="Shell Script to Automate Package Installation on Arch Linux"
arch=('x86_64')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('MIT')
depends=('bash')
source=("https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/release3.2.tar.gz")
sha256sums=('a05ffa54c48d7bf18dff170b3f9e98b8b0cec7e52b67bba14184f37b874b9709') 

build() {
    cd "$srcdir"/*/
    chmod +x autoinstallpackages.sh
}

package() {
    cd "$srcdir"/*/
    install -Dm755 autoinstallpackages.sh "$pkgdir/usr/bin/autoinstallpackages"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

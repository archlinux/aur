# Maintainer: Firebleu <firebluedark@proton.me>
pkgname=autoinstallpackages
pkgver=3.3.1
pkgrel=1
pkgdesc="Shell Script to Automate Package Installation on Arch Linux"
arch=('x86_64')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('MIT')
depends=('bash')
source=("https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/release3.3.1.tar.gz")
sha256sums=('2041abe139f99f5d502789230c81fbc5171d9db9ba41995e59d99f960aeec840') 

build() {
    cd "$srcdir"/*/
    chmod +x autoinstallpackages.sh
}

package() {
    cd "$srcdir"/*/
    install -Dm755 autoinstallpackages.sh "$pkgdir/usr/bin/autoinstallpackages"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

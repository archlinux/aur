# Maintainer: Firebleu <firebluedark@proton.me>
pkgname=autoinstallpackages
pkgver=3.0.1
pkgrel=1
pkgdesc="Shell Script to Automate Package Installation on Arch Linux"
arch=('x86_64')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('MIT')
depends=('bash')
source=("https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/mainrelease.tar.gz")
sha256sums=('bfa8af2e81122c3827e348fb7975344145e930b21c749f2b933ed812272c4c5a') 

build() {
    cd "$srcdir"/*/
    chmod +x autoinstallpackages.sh
}

package() {
    cd "$srcdir"/*/
    install -Dm755 autoinstallpackages.sh "$pkgdir/usr/bin/autoinstallpackages"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

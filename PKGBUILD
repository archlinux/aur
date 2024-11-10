# Maintainer: Firebleu <firebleudark@proton.me>
pkgname=autoinstallpackages
pkgver=2.2.0
pkgrel=1
pkgdesc="Script shell pour automatiser l'installation de paquets sur Arch Linux"
arch=('x86_64')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('MIT')
depends=('bash')
source=("https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/Minor-Release.tar.gz")
sha256sums=('224dc548db7bc86783a01d565e92d57948d2ef30a9b74c2abc9b83fb04a6d2d3') 

build() {
    cd "$srcdir"/*/
    chmod +x autoinstallpackages.sh
}

package() {
    cd "$srcdir"/*/
    install -Dm755 autoinstallpackages.sh "$pkgdir/usr/bin/autoinstallpackages"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

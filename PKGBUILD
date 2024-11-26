# Maintainer: Firebleu <firebluedark@proton.me>
pkgname=autoinstallpackages
pkgver=3.1
pkgrel=1
pkgdesc="Shell Script to Automate Package Installation on Arch Linux"
arch=('x86_64')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('MIT')
depends=('bash')
source=("https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/release3.1.tar.gz")
sha256sums=('f5e007153af21a4ab3d5e69974b7a2a0c9dfc440730e17d396163e92548ee70b') 

build() {
    cd "$srcdir"/*/
    chmod +x autoinstallpackages.sh
}

package() {
    cd "$srcdir"/*/
    install -Dm755 autoinstallpackages.sh "$pkgdir/usr/bin/autoinstallpackages"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: RAI SULEMAN <cerebellumdigital@gmail.com>

pkgname=mkfromtree
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily create folder and file structure from tree text input"
arch=('any')
url="https://github.com/codewithmoss/mkfromtree"
license=('MIT')
depends=('bash' 'coreutils')
source=("https://raw.githubusercontent.com/codewithmoss/mkfromtree/main/mkfromtree.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/mkfromtree.sh" "$pkgdir/usr/bin/mkfromtree"
}


post_install() {
    echo "✅ mkfromtree installed successfully!"
    echo "Run 'mkfromtree' to create folder structures from text inputs."
    echo "For help, visit: https://github.com/codewithmoss/mkfromtree"
}

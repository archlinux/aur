# Maintainer: RAI SULEMAN <cerebellumdigital@gmail.com>
pkgname=morsify
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple bash tool to encode and decode Morse Code."
arch=('any')
url="https://github.com/codewithmoss/morsify"
license=('MIT')
depends=('bash' 'coreutils')
source=("https://raw.githubusercontent.com/codewithmoss/morsify/main/morsify.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 morsify.sh "$pkgdir/usr/bin/morsify"
}


post_install() {
    echo "✅ morsify installed successfully!"
    echo "Run 'morsify' to encode and decode Morse Code."
    echo "For help, visit: https://github.com/codewithmoss/morsify"
}

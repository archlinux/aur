# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous-configs
pkgver=0.0.1
pkgrel=1
pkgdesc="Seafoam Labs Noctalia colorschemes (SeafoamLabs & SeafoamLabs AMOLED)"
arch=('any')
url="https://github.com/Seafoam-Labs/SeafoamLabsDotFiles"
license=('MIT')
depends=()
install=seafoamlabs-dotfiles.install
source=("git+https://github.com/Seafoam-Labs/SeafoamLabsDotFiles.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/SeafoamLabsDotFiles"

    install -Dm644 \
        ".config/noctalia/colorschemes/SeafoamLabs/SeafoamLabs.json" \
        "$pkgdir/usr/share/seafoamlabs-dotfiles/colorschemes/SeafoamLabs/SeafoamLabs.json"

    install -Dm644 \
        ".config/noctalia/colorschemes/SeafoamLabs AMOLED/SeafoamLabs AMOLED.json" \
        "$pkgdir/usr/share/seafoamlabs-dotfiles/colorschemes/SeafoamLabs AMOLED/SeafoamLabs AMOLED.json"
}

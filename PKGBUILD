_git_dir=JetBrainsMono
pkgname="fonts-jetmrains-mono"
pkgver=0.1
pkgrel=1
pkgdesc="A typeface made for developers."
arch=("any")
url="https://github.com/JetBrains/JetBrainsMono"
license=("Apache License 2.0")
depends=()
optdepends=()
makedepends=("git")
source=("git+https://github.com/JetBrains/JetBrainsMono.git")
sha256sums=('SKIP')

# pkgver() {
#   cd $_git_dir
#   git describe --tags | sed 's/^v//;s/-/./g'
# }

package() {

    cd $_git_dir
    mkdir -p "$pkgdir/usr/share/fonts/JetBrainsMono/"
    install -Dm644 ttf/*.ttf "$pkgdir/usr/share/fonts/JetBrainsMono/"

}

# Maintainer: Aneesh Lingala <aneeshlingala61@gmail.com>
pkgname=tiny-editor
pkgver=1.2
pkgrel=6
pkgdesc="A Frickin Tiny Editor, all written in bash!"
arch=('any')
url="https://codeberg.org/aneeshlingala/fkin-tiny-editor"
license=('GPL3')
depends=('bash')
source=("https://codeberg.org/aneeshlingala/fkin-tiny-editor/raw/branch/main/te.bash")
sha256sums=('e7d5641c4c54fd78da8b4c418f338fb44de4cd1651499534c062b22c24e75ae3')

package() {
    install -Dm755 "$srcdir"/te.bash "$pkgdir"/usr/bin/te
}

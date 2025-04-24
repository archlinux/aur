# Maintainer: Amitpal Badhan <amitpal.badhan@uwaterloo.ca>
pkgname=treecat
pkgver=1.0.1
pkgrel=1
pkgdesc="Cat files or directory trees recursively wrapped in Markdown code blocks"
arch=(any)
url="https://github.com/amitpalsbadhan/treecat"
license=(MIT)
depends=(bash coreutils findutils)
source=(
  "treecat::https://raw.githubusercontent.com/amitpalsbadhan/treecat/v${pkgver}/treecat"
  "LICENSE"
  "README.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')  # replace with actual checksum if desired

package() {
  install -Dm755 "treecat"               "$pkgdir/usr/bin/treecat"
  install -Dm644 LICENSE                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                "$pkgdir/usr/share/doc/$pkgname/README.md"
}


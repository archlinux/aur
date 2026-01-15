# Maintainer: sinfulbobcat <bobcatsinful@gmail.com>
pkgname=ez-tree-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="EZ Tree – Procedural tree generator (Electron AppImage)"
arch=('x86_64')
url="https://github.com/sinfulbobcat/ez-tree_electron_aur"
license=('custom')
depends=('fuse2')
provides=('ez-tree')
conflicts=('ez-tree')
source=(
  "ez-tree.AppImage::https://github.com/sinfulbobcat/ez-tree_electron_aur/releases/download/1.0.1/EZTree-1.0.0.AppImage"
  "ez-tree.desktop"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 ez-tree.AppImage "$pkgdir/usr/bin/ez-tree"
  install -Dm644 ez-tree.desktop "$pkgdir/usr/share/applications/ez-tree.desktop"
}

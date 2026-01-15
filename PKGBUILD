# Maintainer: sinfulbobcat <bobcatsinful@gmail.com>
pkgname=ez-tree-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="EZ Tree – Procedural tree generator (Electron AppImage)"
arch=('x86_64')
url="https://github.com/sinfulbobcat/ez-tree_electron_aur"
license=('custom')

source=("ez-tree.AppImage::https://github.com/sinfulbobcat/ez-tree_electron_aur/releases/download/v1.0.1/EZTree-1.0.1.AppImage")
sha256sums=('SKIP')

package() {
  install -Dm755 ez-tree.AppImage "$pkgdir/usr/bin/ez-tree"
}

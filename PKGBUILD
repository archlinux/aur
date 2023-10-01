# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-brushbox
pkgver=2.1
pkgrel=5
pkgdesc='Set of brushes, presets, dynamics made by GrindGod'
arch=('any')
url="https://deviantart.com/grindgod/art/The-Gimp-TextureBox-385558228"
license=('CCPL:cc-by-nc-sa')
depends=('gimp')
source=("://filename.zip")
sha256sums=('SKIP')

package(){
  cd TextureBox
  install -Dm644 Readme.txt -t "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/gimp/2.0"
  cp -r --no-preserve=mode {brushes,dynamics,tool-presets} "$pkgdir/usr/share/gimp/2.0"
}

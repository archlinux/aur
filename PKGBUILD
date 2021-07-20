# Maintainer: Dringsim <dringsim@qq.com>

pkgname=rime-fraktur
pkgver=0.1
pkgrel=1
pkgdesc="Fraktur input for RIME"
arch=('any')
url="https://github.com/Dringsim/rime-fraktur"
license=('CC0')
source=("fraktur.schema.yaml")
md5sums=('b369403009afa64c1aac75b06febf408')

package() {
  install -Dm 644 "$srcdir/fraktur.schema.yaml" -t "$pkgdir/usr/share/rime-data/"
}
# Maintainer: killab33z <killab33z @ protonmail-dot-com>
# Previous Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pacgraph
pkgver=20110629
pkgrel=8
pkgdesc="Draws a graph of installed packages to PNG/SVG/GUI/console.  Good for finding bloat."
arch=('any')
url="https://github.com/keenerd/pacgraph"
raw_url="https://raw.githubusercontent.com/keenerd/pacgraph/master"
license=('GPL')
depends=('python')
optdepends=('inkscape: png backend'
            'imagemagick: png backend'
            'tk: gui version')
provides=('pacgraph')
conflicts=('pacgraph')
source=("$raw_url/pacgraph"
        "$raw_url/pacgraph-tk"
        "$raw_url/pacgraph.1")
sha512sums=('bbf5bb3493f0abc54324fa43fed390eb1deacfa2c01ed67a6553a1a18a6081a9f09fbae531e0de8f10693a9a9d2d9255f80df7736118fb5f61eb63df9b05c850'
            '3c42b85b4f6dc6d4022d9864a9ef10a9c0bc5920cccf93540bae6641bf39e3f024126ecc67c2ed8054066f197e5690477b525ec5021b23f9205618df4039327b'
            'fa3ff8b80f4ea8ffa893e51c952a0db3ffdeff262e87fbf13617ef351623fdd84c6d8a76edc3f2181baf8543230db4d0db3e16506bf899ef350d1bce81329837')

package() {
  install -Dm0755 $srcdir/pacgraph    "$pkgdir/usr/bin/pacgraph"
  install -Dm0755 $srcdir/pacgraph-tk "$pkgdir/usr/bin/pacgraph-tk"
  install -Dm644  $srcdir/$pkgname.1  "$pkgdir/usr/share/man/man1/$pkgname.1"
}


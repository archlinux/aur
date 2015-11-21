# Maintainer: Andrew Gallant
pkgname=jgraph
pkgver=20131228
pkgrel=1
pkgdesc="A filter for plotting graphs in postscript"
arch=('any')
url="http://web.eecs.utk.edu/~plank/plank/jgraph/jgraph.html"
license=('Custom')
groups=()
source=(http://web.eecs.utk.edu/~plank/plank/jgraph/2012-10-15-Jgraph.tar
        jgrtoppm)
noextract=()
install=
md5sums=('e8b41f5f5fb286dd7896af4dfd6e9324'
         '300bb41658a410d0e5276357e42e5fad')

build() {
  cd jgraph
  make
  install -Dm755 ./jgraph "$pkgdir/usr/bin/jgraph"
  install -Dm644 ./jgraph.1 "$pkgdir/usr/share/man/man1/jgraph.1"

  cd ..
  install -Dm755 ./jgrtoppm "$pkgdir/usr/bin/jgrtoppm"
}
md5sums=('e8b41f5f5fb286dd7896af4dfd6e9324'
         '300bb41658a410d0e5276357e42e5fad')

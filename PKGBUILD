# Maintainer: Tarn Burton <twburton at gmail dot com>
_npmscope=@dicy
_npmname=cli
pkgname=nodejs-dicy-cli
pkgver=0.12.3
pkgrel=1
pkgdesc="A JavaScript based builder for LaTeX, knitr and literate Haskell that automatically builds dependencies."
arch=(any)
url="https://yitzchak.github.io/dicy/"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=()

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmscope/$_npmname@$pkgver
}


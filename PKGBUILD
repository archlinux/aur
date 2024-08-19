# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Sebastien MacDougall-Landry

pkgname=zpl
pkgver=19.5.0
pkgrel=1
pkgdesc='C99 header-only library oriented towards improving the coding experience.'
url='https://github.com/zpl-c/zpl'
source=("$url/releases/download/$pkgver/zpl.h")
arch=('any')
license=('Unlicense' 'BSD')
sha256sums=('f1b3098600e3dc73ec6765c3e108f8506f6299237d837808992a42c0f33dfbdb')

package () {
  install -Dm644 zpl.h -t "$pkgdir/usr/include/"
}


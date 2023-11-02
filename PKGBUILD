# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Sebastien MacDougall-Landry

pkgname=zpl
pkgver=19.4.1
pkgrel=1
pkgdesc='C99 header-only library oriented towards improving the coding experience.'
url='https://github.com/zpl-c/zpl'
source=("$url/releases/download/$pkgver/zpl.h")
arch=('any')
license=('Unlicense' 'BSD')
sha256sums=('9ff91837e6f0eb37b0090f33077fce6461ad0f01ebcb7e0f8d3fd19b0aeb66a2')

package () {
  install -Dm644 zpl.h -t "$pkgdir/usr/include/"
}


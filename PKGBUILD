# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.5.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a352e13a8438045b8ed138b821cb757c177acd999c1af77345152d7a64b0ddb7')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

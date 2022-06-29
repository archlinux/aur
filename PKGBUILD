# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.11.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9fc7bc15b55aea3025cd21f9d4e1384d1538beec5f7090cc0b7c45857cad3e57')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.10.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('766f27f30a0b28aa3a88d1fa2ba6f698692403e4115dab48f319b88d43d12d04')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

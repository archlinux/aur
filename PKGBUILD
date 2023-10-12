# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.11.3
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('07efe78fd56de173e29f15ea5be2aa6f425d346bcd480aa229840b5405661cb2')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

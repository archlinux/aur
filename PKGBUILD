# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.11.2
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_Linux_x86_64.tar.gz")
sha256sums=('7620e8ee58613c1aace2890b76b850ac4efaf440083f927a1c316173ef3f3c18')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

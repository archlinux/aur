# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.12.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('f0a9f105de7b1c07e19f3ececa52e3a5a270ffe39b744cdce1a26bea34025abf')

package() {
	install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

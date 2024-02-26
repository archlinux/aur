# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.13.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL-3.0-or-later')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('fc5e6cd5d44efa5a40ae4874e261e5ee200119e379291582cc4c9303abb1a5fe')

package() {
	install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

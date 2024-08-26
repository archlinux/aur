# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.14.2
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL-3.0-or-later')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a8cf72ada34fad93285ba2a452b38bdc5bd52cc9a571236244ec31022928d6cc')

package() {
	install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}

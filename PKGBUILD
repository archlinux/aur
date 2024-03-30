# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.10.1
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('d8c784bcb81072684b8234b2c2244ec12fc85ead39f30c7af7ac5efb5a59174b')

package() {
	install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

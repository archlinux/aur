# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.8.2
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4af7c7044d6f2061292f34eb26d440d7fd5c2862dfff529b99e3d0b83c7dfbc8')

package() {
	install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.18.1
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('243795d00558d1b8867b0acef126bfdaea1c8b03da807dcb2aca73fbe1c79916')

package() {
	install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

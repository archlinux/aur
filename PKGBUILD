# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.11.1
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('35fba5e1e9b31beb86e4ecc9cbe516dfa7fb9802e5ca55e8560ccc59a69dda3a')

package() {
	install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

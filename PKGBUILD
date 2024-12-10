# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.16.0
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('bdead74243cea85ac05ddb48e5764788dc7e252dfbaa0346a3e0b3f234b1a08a')

package() {
	install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

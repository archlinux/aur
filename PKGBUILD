# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('cb984f228e501f22f667a9b1d28e8ad4b65430da4aadfc3e62b038df3ce3f3ed')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

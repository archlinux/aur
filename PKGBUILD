# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('127fab2390f3ba81d1d9e58a646b7e5888e295eb44614cee2e944df3aedf8c9e')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.13.1
pkgrel=2
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}-${pkgrel}/helm-schema_${pkgver}-${pkgrel}_Linux_x86_64.tar.gz")
sha256sums=('87e4888894b60f96fb95a9a175065897453a4eb592bf1d1a8a750067d7dd068f')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

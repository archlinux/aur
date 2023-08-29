# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.4.2
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_Linux_x86_64.tar.gz")
sha256sums=('3e3bf8ae3e58715d20fa767cca49f1bcfc784bb07ce3894ebf80463b6749e327')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

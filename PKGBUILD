# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.8.1
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('f218c493e8ef0568aeb6f6c12f510afafe1e7e4d4818d0e22e59273368de67e4')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}

# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=helm-schema
pkgver=0.4.2
pkgrel=1
pkgdesc="A tool for automatically generating jsonschema files for helm charts"
arch=('x86_64')
url="https://github.com/dadav/helm-schema"
license=('MIT')
source=("https://github.com/dadav/helm-schema/releases/download/${pkgver}/helm-schema_Linux_x86_64.tar.gz")
sha256sums=('e001490b4fa0508aa3714a29b49e5834ffdfb9bbd84386597e2835f12b826fbc')

package() {
  install -D -m755 "$srcdir"/helm-schema "$pkgdir/usr/bin/helm-schema"
}
